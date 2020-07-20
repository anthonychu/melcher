---
title: SharePoint App, Custom Domain and free SSL certificate
author: Max Melcher
aliases:
   - "/post/2017-03-25-sharepoint-app-custom-domain-free-ssl-certificate/"
2017: "03"
type: post
date: 2017-03-25T11:52:43+00:00
url: /2017/03/sharepoint-app-custom-domain-free-ssl-certificate/
categories:
  - Azure
  - Office 365
  - SharePoint 2013
  - SharePoint 2016
  - SharePoint Addins
  - SharePoint Online

---
Recently I created lots of SharePoint provider hosted apps for several customers - most of them very simple apps to register a remote event receiver or send emails. But a few of them were complex business apps that used the integration options for SharePoint but stood almost separately as websites running on Azure. The first apps we created had the name <app>.azurewebsites.net - and for some customers that looked so odd that they opened tickets and asked for confirmation if the apps are legit. And that makes perfect sense because everybody could create a website and call it superlegitcustomerapp.azurewebsite.net, right? So in this blog post I will show you how to run an app on a custom domain with a free SSL certificate.

For this article I assume that you have your SharePoint App up and running on Azure - and I assume that you have a domain to use.

## Register the custom domain on Azure

{{< fancybox "/wp-content/uploads" "azure-website-custom-domain.png" "" "single_image" >}}

First things first - tell the azure website that it will have a new hostname to respond to. Therefore go to the azure portal, open your website and click on "custom domain". Then add your domain or subdomain that should be the new entry point of your app. Once you have done that, you need to validate the websites by adding a txt record to your nameserver with the value * mapped to .azurewebsites.net - full guide is [here][1].

{{< fancybox "/wp-content/uploads" "domain-validation-1.png" "" "single_image" >}}

After validation was successfully it should look like that:

{{< fancybox "/wp-content/uploads" "azure-hostname.png" "" "single_image" >}}

For the custom domain you need at least a shared instance tier for your azure website.

## New name - new problems

Ok, now we have setup the new hostname and we can open up the site with that - but that creates some problems:

  1. The app registration (/_layouts/15/appregnew.aspx) needs to be updated
  2. The app manifest and the app points to the old site
  3. There is no SSL certificate for the new name

1 & 2 are easy solvable: Open the app in Visual Studio, change the app domain, upload it to the app store, trust it and re-add it to your sites. But if you open the new app - you will either redirect to http:// and have all you traffic sent over an encrypted connection - or you send it to https:// and will be greated by a security warning in your browser because there is no SSL certificate present for your new domain.

## Free SSL certificate

In the past I heavily used free SSL certificates from [StartCom][2] because they were trusted in all browsers and were free for 1 year - but they lost trust in google chrome and firefox recently so that is no longer an option. Not using a ssl certificate is no option at all - business apps need security and trust - therefore I needed another option, preferably free so no long discussion with customers, CSRs and all that to request a certificate for your needs. I want easy.

## Let's encrypt for the rescue

There is a really great organization that provides free SSL certificates - [Let's Encrypt][3] - and I use them for this blog with ease, too. So why not use them for my Azure websites? The let's encrypt certificates only lasts 3 months and should be renewed automatically (way better than certificates that lasts 1 year and have to be renewed **manually**&#8230;) - so there should be some sort of integration right into the azure websites for that - and there is! Thanks to the awesome work of [Simon J.K. Pedersen][4] there is a [Azure Website Extension for Let's Encrypt][5].

The installation was really straightforward for me and is [well documented here][6] - I added the extension (choose the correct version for 32 or 64bit!), register a new service principal and give it contribute permissions - open the extension site https://.scm.azurewebsites.net/letsencrypt/ and enter all the required values:

[{{< fancybox "/wp-content/uploads" "LetsEncryptExtensionSettings.png" "" "single_image" >}}][7]

Once you save it the magic happens - two webjobs will be registered that request a new certificate, register them and two weeks before expiry renew them automatically for you. Awesomesauce!

For the custom ssl certificate you need at least a basic app service plan.

## Summary

So once you have done all that you will have a nice domain for your app - giving your users trust and easy to recall entry to your business application - and all that is free with zero maintenance. And all your browsers love it, too:

{{< fancybox "/wp-content/uploads" "chrome-secure.png" "" "single_image" >}}

{{< fancybox "/wp-content/uploads" "IE-trust.png" "" "single_image" >}}

&nbsp;

So if you create a new app - register the domain first, follow the guide above and you are good to go - the secure way: customer happy, developer happy, security guy happy! 🙂

&nbsp;

&nbsp;

&nbsp;

 [1]: https://docs.microsoft.com/en-us/azure/app-service-web/web-sites-custom-domain-name
 [2]: http://startssl.com
 [3]: https://letsencrypt.org/
 [4]: https://twitter.com/simped?lang=en
 [5]: https://github.com/sjkp/letsencrypt-siteextension
 [6]: https://github.com/sjkp/letsencrypt-siteextension/wiki/How-to-install
 [7]: https://melcher.it/wp-content/uploads/LetsEncryptExtensionSettings.png
