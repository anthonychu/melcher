---
title: "Azure Storage Static Website - SSL and Root Domain DNS"
date: 2019-06-16T14:01:36+02:00
2019: "06"
author: "Max Melcher"
categories:
  - Hugo
  - Azure
tags:
  - Storage
  - SubDomain
  - RootDomain
  - SSL
featured: "images/featured.png"
featuredalt : ""
hashtags: 
  - "#azure"
---

Azure Storage Static website feature is really awesome - and [great websites for less than 1$ a month can be hosted](/2019/03/running-hugo-on-azure-for-2-a-month/) with them - but unfortunately, they can only mapped to subdomains.
In this article, I explain how to get it working for both root and subdomains.
<!--more-->

## Azure Storage Static Website

As mentioned a few times here and there, I am using [Azure Storage Static Websites](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blob-static-website) to host a few websites ([read more](/2019/03/running-hugo-on-azure-for-2-a-month/), [here](/2018/11/penny-pinching-migrating-app-service-to-azure-storage-website-hosting/) and [here](/2017/11/bye-bye-wordpress-hello-hugo/)).
It works great, is performant and overall I pretty much enjoy blogging more - maybe writing in VS Code gives me more joy than in Wordpress.
The only thing that bugged me setting up the website, was the fact that you cannot host Azure Storage Static Websites on the root domain. So if your website only lives on **www**.yourawesomewebsite.net (subdomain) then you are fine - if you want to serve your website also on yourawesomewebsite.com (rootdomain) then you cannot do that natively on Azure Storage.

[I put a neat little note](https://github.com/MicrosoftDocs/azure-docs/commit/39c8f4c0e270fd2a8a5e06180a618ffd0231a608#diff-b9174b619723e77ac4a4393d9cd3ea73) on the [docs.microsoft.com](https://docs.microsoft.com) page so that people do not waste too much time on it:
{{< fancybox "images" "AzureStorage_CustomDomainMapping.png" "Note that only subdomains work" "single_image" >}}

It's really awesome that you can just update the documentation if you think that something is missing or not like you would expect it.

But let's move on to a solution.

## Azure CDN and Cloudflare

In my solution, and I guess there are more ways to solve it, I use Azure CDN and Cloudfare to get my blog served on the rootdomains and subdomains:

* [melcher.dev](https://melcher.dev)
* [melcher.it](https://melcher.it)
* [www.melcher.dev](https://www.melcher.dev)
* [www.melcher.it](https://www.melcher.it)

For that, you have to create the Azure CDN that maps to your Azure Storage Static Website. You can do that by creating a CDN profile. I chose the Microsoft Standard CDN because its cheap and has the features that I need. Afterwards I created an endpoint that exposes the Azure Storage:

{{< fancybox "images" "AzureCDN_AddEndpoint.png" "Azure CDN Endpoint mapped to Azure Storage" "single_image" >}}

Now my website is served through the cache and is available at [melcher.azureedge.net](https://melcher.azureedge.net)

Then the most time consuming part needs to be done. You have to request a free SSL certificates for the CDN for your root and subdomains - all of them. Click on Custom Domain and create them:

{{< fancybox "images" "AzureCDN_CustomDomains.png" "4 custom domains with certificates" "single_image" >}}
That process depends on your domain registrar, but the Azure wizard will guide you through it.

Once this is done, the Azure CDN can present a valid SSL certificate if it gets requested.

That could be it, but, there is a SEO downside if you just use it like that.

## Redirects for www and second domains

I do not want to get SEO punished for serving content on the same domains (if you only have one root domain you are probably fine!), so I forward traffic from www to the rootdomain and from melcher.it to melcher.dev. In order to do this I use Cloudflare to manage my Domains (and have a second cache).
{{< fancybox "images" "Cloudflare_DNS2.png" "DNS setup on Cloudflare" "single_image" >}}
The only issue I had with Cloudflare and Azure is the domain validation part. If you do validate the domain, you have to disable the Cloudflare proxy for that time (disable the cloud icon on the far right) - otherwise it wont work. If the validation does not work, try it with the [alternative verification method](https://docs.microsoft.com/en-us/azure/cdn/cdn-map-content-to-custom-domain#map-the-temporary-cdnverify-subdomain) - and be patient - DNS stuff takes time.

And then, finally, you can manage the Cloudflare Page Rules to forward the traffic to the one and only domain:

{{< fancybox "images" "Cloudflare_PageRule.png" "Cloudflare Page Rule to forward domains" "single_image" >}}

In my case I route everything

> *melcher.it/*

to my new domain

> https://melcher.dev/$2

the * is a wildcard that matches everything and can be reused in $ variables. So $2 is the match behind melcher.it/.

That's great - and you can do that with the Cloudflare basic account that is free.
By enabling the Cloudflare proxy you get a second cache in front of the Azure CDN - so Cloudflare will reduce your Azure bill by reducing the requests. Awesome.

The request flows to the following services:
{{< fancybox "images" "requestflow.png" "Request flow" "single_image" >}}

It is not as convenient as it should be, but once configured it is mostly free and a super solid setup.
