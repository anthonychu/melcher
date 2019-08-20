---
title: "Running Hugo on Azure for 2$ a Month"
date: 2019-03-27T07:14:44+01:00
2019: "03"
author: "Max Melcher"
aliases: 
  - "/2019/03/running-hugo-on-azure-for-2-a-month/"
  - "/draft/2019-03-21-running-hugo-on-azure-for-2-a-month/"
categories:
  - Hugo
tags:
  - Hugo
  - Performance
  - Azure
  - Azure Storage
  - Azure CDN
  - Cloudflare
  - Azure DevOps
featured: "images/HugoAzureDevOpsAzureStorage.png"
featuredalt : "Hugo, Azure DevOps and Azure Storage Static Website - a fast and modern hosting platform for static websites"
hashtags: 
  - "#azure"
  - "#gohugo"
---

Hosting a super fast, modern, yet super-simple blog on Azure for 2$ a month?
In this post, I explain, step by step, how I run this blog "serverless" and how my architecture evolved and simplified over time. Never had so much fun to blog.
<!--more-->

## Hugo - a primer

[Hugo](https://gohugo.io/) is a static website generator that I chose because of its **simplicity** and **performance**. You write a few lines of Markdown in VSCode, Hugo compiles them literally in milliseconds to HTML. You put the HTML on a web server and you are done. No additional moving parts like databases and pretty small attack surface because everything is static (looking at you, Wordpress plugins!). No parts that I have to patch! Simplicity wins.

{{< fancybox "images" "Hugo.png" "Hugo is one of the most popular open-source static site generators. With its amazing speed and flexibility, Hugo makes building websites fun again." "single_image" >}}

From the publishing side, with Hugo, you get a modern content management system with a **great community** and awesome features. And because you just write markdown files, you can choose every editor that you want to use. And you can compose them **without internet connectivity**. You can tell, I am a big fan!

My publishing workflow: I create my posts in [VSCode](https://code.visualstudio.com) - the experience for writing this post looks like this:
{{< fancybox "images" "VSCode.png" "Creating posts in VSCode" "single_image" >}}

With the local web server that comes with Hugo, I get an instant preview:
{{< fancybox "images" "HugoLocalPreview.png" "Creating posts in VSCode" "single_image" >}}

Building my entire blog with 1087 pages and a lot of other stuff took 6 seconds:
{{< fancybox "images" "HugoServer.png" "Running locally" "single_image" >}}

Great, right?

At first, I was worried about Markdown - but with the live preview and a [markdown cheat sheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) it is a **what you see is what you get (WYSISWG)** experience that just works everywhere. Because I can edit my posts in Azure DevOps in a browser, I am not even dependant on a local environment. That comes handy if you quickly want to fix a typo or a quick update. And with git as a backend, I can commit tiny changes, continue later, switch PCs - as simple as writing code ;)

Lastly, I use [tinypng.com/](https://tinypng.com/) to compress my images. And the '[Check my links](https://chrome.google.com/webstore/detail/check-my-links/ojkcdipcgfaekbeaelaapakgnjflfglf?hl=en)' Chrome extension to quickly check that all links are correct.

## Evolving Architecture - things get faster, better, cheaper

When I migrated of Wordpress to Hugo, I [hosted this blog](/post/2017-11-02-ByeByeWordpress-HelloHugo/) on Azure App Service. This was great to get going, and by then there was no alternative to me. Once the [Azure Storage Static Website](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blob-static-website) feature was available, I immediately made the switch to it. Having simple storage that can be exposed to the web is a quick win for static websites and a no-brainer from a cost perspective. So I migrated to that and switched to Azure DevOps for updating my blog in a CI/CD manner. Cutting the cost from 70$ to approx 2$ per month is awesome.

{{< fancybox "images" "OldArchitecture.png" "The old architecture of my blog" "single_image" >}}

The old architecture was not overly complicated - but doing a build with a [.deployment file pointing to a .bat file](https://github.com/projectkudu/kudu/wiki/Custom-Deployment-Script) felt awkward. My source code was in bitbucket and a push to it triggered a deployment. Okayish, but too expensive for my tiny blog because of the fully fledged App Service.

## How to build it

So if you want to have a neat little website or blog for small money, I am going to give you a step by step instruction how to get up and running. Bare with me, it is a rather long post.

As a prerequisite you need the following:

### Prerequisites

1. a [free Azure Account](https://azure.microsoft.com/en-us/free/). You can try for free for 12 months and get 5GB of storage to host your website.
2. a [free Azure DevOps Account](https://azure.microsoft.com/en-us/pricing/details/devops/azure-devops-services/). It's free for up to 5 users and you get 1800 build minutes to update your blog. If you open source your code, then you get unlimited build minutes!
3. [VSCode](https://code.visualstudio.com/) (free) - or a similar and awesome code editor.

### Prerequisites for initial setup

I use the awesome ['yo team' generator](https://github.com/DarqueWarrior/generator-team) by [Donovan Brown](http://donovanbrown.com/post/yo-Team) to set up and configure Azure DevOps. This is not the only way to create an Azure DevOps project, but for me it automates the following:

* It creates an Azure DevOps project
* It creates a Service Endpoint so Azure DevOps is allowed to create resources on Azure.
* It creates a new git project locally and connects it with the Azure DevOps git repository.

A prerequisite for 'yo team' is an installation of [Node.js](https://nodejs.org/en/) (install the LTS version!). Once you have it installed, you can install yeoman and the generator with

{{< highlight PowerShell >}}
npm install -g yo generator-team
{{< /highlight >}}

Now let's get started:

## Step 1: Setting up Azure DevOps

As mentioned earlier, with 'yo team' installed you can script the basic setup of Azure DevOps, the build pipeline and the connection to Azure. To make it work you need a Personal Access Token (PAT) to authenticate against Azure DevOps. You can create a PAT via the following link:  
https://dev.azure.com/[ORGANIZATION]/_usersSettings/tokens  
*You have to replace [ORGANIZATION] with your organization, of course.*
Then click on "New Token" on the left and create a token with full access scope that is valid for 30 days. We do this only once, so it is not required to have a token that lives longer.

{{< fancybox "images" "PAT.png" "Generate a Personal Access Token" "single_image" >}}

After saving the form, you get the PAT. Please copy it to a safe place so that we can use it later. Once you leave the page, you can't see it again and would have to create a new one.

Next up, copy the script below and replace the 3 placeholders:

1. $projectName with the name of your new project
2. $organizationName with the name of your Azure DevOps organization.
3. $azureDevOpsPersonalAccessToken with the PAT you generated before.

Then execute the following command to create the project:
{{< highlight PowerShell >}}
yo team:project --applicationName $projectName --tfs $organizationName --pat $azureDevOpsPersonalAccessToken
{{< /highlight >}}

{{< fancybox "images" "CreateProject.png" "yo team creates the Azure DevOps project" "single_image" >}}

Afterward, you have a new, empty project in Azure DevOps:
{{< fancybox "images" "NewProject.png" "The new Azure DevOps project" "single_image" >}}

Next up, we need to connect Azure DevOps with Azure so that we can create resources on Azure and finally store the HTML files. Therefore I use the yo team wizard to create the connection by using the command:

{{< highlight bash >}}
yo team:azure
{{< /highlight >}}

The required values and the Azure connection is then prompted:
{{< fancybox "images" "AzureDevOpsServiceEndpoint.png" "Create a new service connection from Azure DevOps to Azure" "single_image" >}}

After successfully providing all values, you have a new service connection in Azure DevOps:
{{< fancybox "images" "ServiceConnection.png" "The new service connection in Azure DevOps" "single_image" >}}
Url: https://dev.azure.com/[Organization]/[Project]/_settings/adminservices
Please note down the Azure Subscription that you selected, in my case that is *Microsoft Azure Internal Consumption*.

Next, we create a local git repository and connect it to Azure DevOps. Open a PowerShell prompt and navigate to a folder where the git repository should be stored and then execute:
{{< highlight bash >}}
yo team:git
{{< /highlight >}}

Again, provide the prompted values:
{{< fancybox "images" "Git.png" "Connect local git with Azure DevOps" "single_image" >}}

Afterward, download the following [yaml build file](azure-pipelines.yml) and open it with a text editor.

In line 17 you have to specify the Azure subscription name. When in doubt, get it [here](https://ms.portal.azure.com/#blade/Microsoft_Azure_Billing/SubscriptionsBlade).
In line 20 you can specify the resource group name.
In line 21 you must specify the storage account name. This name must be unique, otherwise, the creation will fail.
In line 22 you can specify the storage location.
In line 33 you have to specify the Azure subscription name, same as line 17.
In line 35 you have to add the same storage account name from line 21.


Once you commit this file and push it to Azure DevOps, a build is triggered. It will create a storage account for you with the static website feature enabled.

The foundation is done, now let's configure Hugo.

## Step 2: Setting up Hugo

The steps to create a new Hugo site are pretty easy. Firstly you need the Hugo executable. Most conveniently you get it via chocolatey by using
{{< highlight bash >}}choco install -y hugo{{< /highlight >}}
but you could also just download the [latest version](https://github.com/gohugoio/hugo/releases) of Github.

Once you have that, open a PowerShell prompt and navigate to the git folder we created above. The use
{{< highlight bash >}}
hugo new site --force .
{{< /highlight >}}
to create a new, empty Hugo site.

Hugo comes by default without a theme, so you have to get one from [the theme catalog](https://themes.gohugo.io/).
I started with the theme "[Ananke](https://github.com/budparr/gohugo-theme-ananke.git )" and cloned it into the themes subfolder.

{{< highlight bash >}}
git submodule add https://github.com/budparr/gohugo-theme-ananke.git themes/gohugo-theme-ananke
{{< /highlight >}}

To start with an example site, use the following commands:
{{< highlight bash >}}
#copy the example site to the parent folder
Copy-Item -Recurse -Force .\themes\gohugo-theme-ananke\exampleSite\* .
#adjust the theme configuration
(Get-Content config.toml) -replace 'themesDir = "../.."' | Set-Content config.toml
{{< /highlight >}}

The rest of the theme options are explained in the [theme repository](https://github.com/budparr/gohugo-theme-ananke) - you can configure a lot of stuff. If you want to use my theme, I adjusted '[hugo-future-imperfect]'(https://github.com/jpescador/hugo-future-imperfect) to my needs.

To see the website locally, start Hugo in server mode:

{{< highlight bash >}}hugo server{{< /highlight >}}

Then your website will be available at http://localhost:1313 and should look like this:

{{< fancybox "images" "Ananke.png" "the empty Ananke theme rendered locally" "single_image" >}}

## Step 3: Publish

Great, you read so far! You are just a push away to have the website running on Azure:

{{< highlight bash >}}
git add .
git commit -m "first push"
git push
{{< /highlight >}}

Then switch to Azure DevOps to see the build output  
https://dev.azure.com/[organization]/[project]/_build/ (replace the placeholder)

{{< fancybox "images" "HugoCICD.png" "CICD publishing of my posts" "single_image" >}}
A build takes approximately 3 minutes here - after the first build you could disable the Azure CLI task, that would save 50% so publishing only takes 90 seconds.

Once that successfully ran, the new website is available at:   
https://mamelch12345.z6.web.core.windows.net/ - your URL is of course different.

You can get your URL either in the Azure Portal or you can click on the Azure DevOps build on the Task "Azure CLI". It is shown in the 'primaryEndpoint' block:

{{< fancybox "images" "WebEndpointAzureStorage.png" "The web endpoint is shown during the build" "single_image" >}}

## Your domain

Lastly, you should, of course, point your domain to the storage account. This can be done in the Azure portal (no automation AFAIK), [documentation is available here](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-custom-domain-name). Unfortunately, with this approach, you do not get an SSL certificate for your domain and you cannot add it right away, yet. To add a certificate and a custom domain, you should follow this guide, to [put Azure CDN in front of the Azure Storage](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-https-custom-domain-cdn). My domain is currently managed by Cloudflare, I added their cloud proxy in front of the Azure CDN - that further reduces my cost.

## Current Architecture

To sum it up: In my current architecture, I use Azure DevOps to store my source code (free), using the build minutes (free) to put the resulting HTML files on Azure Storage (almost free). Then I use Azure CDN to speed up the delivery worldwide (almost free). Additionally, I index my blog with Azure Search (free) to have a [top-notch search function](/2019/03/azuresearch-and-hugo-free-and-awesome/).

{{< fancybox "images" "CurrentArchitecture.png" "The current architecture, Azure Storage, Azure Search, Azure CDN" "single_image" >}}

## More Hugo

In this post, I could only scratch the surface of what Hugo is capable of, so I really suggest you dive into the great [documentation](https://gohugo.io/documentation/) to learn more.

## Costs

Ok, let's have a look at the cost:
{{< fancybox "images" "CurrentCost.png" "My current cost" "single_image" >}}

So 5.63€ for March 2019? You said 2$ a month!!! Well, yes, on average it is that. But in March I experimented a lot and that resulted in several wipes of the entire Azure Storage. Additionally, I had GRS (geo-redundant storage) enabled on this storage account for reasons that are no longer available to me. The normal month is usually 2$ for me. All transaction- or transfer-related costs should be pretty much covered by the Cloudflare CDN proxy in front of the Azure CDN, so even huge spikes do not cost me anything. Awesome.

For completeness, [here is the calculation](https://azure.com/e/8b7ded10f33649f394df514a2f21b182).

0.92$ - still not 2$. Yepp, I automated the post to Twitter and LinkedIn with a LogicApp and that one cost 1.11$ per month. And it checked my blog every minute for new posts by polling the RSS feed, reduced it to 60 minutes to save some pennies.

## Performance

Comparing website performance is a tough and complex matter. As mentioned above, every request is cached with the excellent Cloudflare proxy. Static HTML files are perfect for caching and there is no other IO dependency (e.g. database connect) for my blog:

{{< fancybox "images" "Bitcatcha.png" "Server response time tested with bitcatcha" "single_image" >}}

So the [response times]((https://www.bitcatcha.com/my-report/?r=MTI0OTk3NDA%3D)) around the globe are super low.
Other performance optimizations like javascript & CSS bundling are provided by Hugo - but it really depends on the theme and how it is implemented. And on the images that you put on your pages...
Am I happy with the perceived performance? For 2$ a month and the little time I put into optimizing my blog: I am super happy.

Chrome most of the time loads in less than a second:
{{< fancybox "images" "ChromePerformance.png" "Less than a second to load the landing page!" "single_image" >}}

Google Analytics claims that the average load time is: 2.91s
{{< fancybox "images" "GoogleAnalytics.png" "2.91s load time on average" "single_image" >}}
I am questioning the numbers a little here - Internet Explorer is the fastest browser?!

But in general, I am totally fine with the performance - how fast did the page load for you?!

## Security

Security and Static Websites are a great start for decent security. No SQL injections, no connection strings, no web servers that you have to patch, no PHP - nothing. And a free SSL certificate secures all traffic (Cloudflare makes that one very easy!) - good, right?
Additionally, I configured [HTTP Strict Transport Security (HSTS)](https://en.wikipedia.org/wiki/HTTP_Strict_Transport_Security), so accessing this blog without SSL is prohibited. The only thing that I need to protect is the access to the Azure storage account and my CDNs. 2-Factor and passwords even I do not know should be ok.

On the other hand, additional headers, like [Referrer-Policy](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Referrer-Policy) or [X-Frame-Options](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Frame-Options), [Content-Security-Policy](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy) cannot be set.

And then there are some parts that are a little out of my hands. Like the [DISQUS comment](https://disqus.com/) integration. If they screw up, it will affect my blog. But I am pretty sure they have decent security measures, so I accept that risk.

## Tiny things I love about Hugo

Additionally, here are a few points that might come unnoticed if you briefly look at Hugo, but are great if you need them:

### Simple template language

As mentioned before, I started with the awesome 'hugo-future-imperfect' theme. It's well written and the critical parts are documented. With that, it was rather easy for me to do tiny adjustments:

1. Adding [the free Azure Search](/2019/03/azuresearch-and-hugo-free-and-awesome/) as 'search as you type' addon.
1. changing the ['scroll-to-top' function](http://tholman.com/elevator.js/) in the bottom right (turn sound on).
1. Modernizing the javascript frameworks
1. Adding placeholders here and there that are managed centrally.
1. Showing the recent 3 posts in the sidebar, but not the one that is shown on the right.
1. Putting the Xing social icon in the top
1. Tweaked the header on the left
1. Added [yearly/monthly archives](/2019/01/inconvenient-hugo-yearly/monthly-archives/), e.g. [all posts for 2019](/2019) or [March 2019](/2019/03)

### Plain markdown files

After [migrating of Wordpress](https://gohugo.io/tools/migrations/#wordpress), I had lots of issues keeping my URL schema or my short URLs up and running. But I used a few lines of PowerShell to update the page metadata. I had to do this multiple times because of some edge cases, but with the power of git, a revert was super fast and effective. I really like the [Front Matter](https://gohugo.io/content-management/front-matter/), the metadata describing a post, in the readable form attached to a post. It makes just sense.

{{< fancybox "images" "Frontmatter.png" "Metadata of my posts" "single_image" >}}
In the screenshot, you can see all the metadata I provide for my posts. You can easily extend them and use them in your theme.

### Drafts in the open / Short URLs

Usually, a draft is not visible to anyone and of course, that is okay. But sometimes you want to share a draft with someone for a review or help. So on Wordpress, I, therefore, installed a plugin, that made private sharing possible by adding a token to the URL so that only people with that link could access the draft. And I thought I want to have that for Hugo, too. Luckily with the flexible template language of Hugo, that is very easy to do. Create a new folder in the content section and then hide it from the places where Hugo iterates all posts (for me that is index.HTML, [home.json](/2019/03/azuresearch-and-hugo-free-and-awesome/), rss.xml, sitemap.xml - but depends on your theme!). The iteration then looks like this:

{{< highlight bash "linenos=table,hl_lines=1" >}}
{{ $paginator := .Paginate (where .Site.RegularPages "Section" "not in" (slice "s" "draft") ) }} 
    {{ range $paginator.Pages }} 
        {{ .Render "content-list" }} 
        {{ partial "share-menu" . }} 
    {{ end }}
{{< /highlight >}}

I line 1 you can see that I do a where clause on all Pages that are not in the Section "s" nor in "draft". In other words I hide my shorturls and my drafts.

If you then add an [Alias](https://gohugo.io/content-management/urls/#aliases) to the Front Matter, then the URL is still available after regular publishing.

The same approach can be used for short-URLs, too.

## Summary

I guess that is the longest and detailed post I ever wrote: I hope you came so far and learned a bit here and there - if so, make my day and leave a comment!
If things in the step-by-step guide did not work out for you, leave a comment.
If you have other thoughts an concerns about the costs, security - leave a comment :)

Hope it helps,  
Max