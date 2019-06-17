---
title: 'Penny Pinching: Migrating App Service to Azure Storage Website Hosting'
author: Max Melcher
aliases:
   - "/post/2018-11-11-AppService-To-AzureStorage/"
2018: "11"
type: post
image: 
  - /images/2018/AzureStorage/katie-harp-pinterest-manager-1080597-unsplash.png
featured: katie-harp-pinterest-manager-1080597-unsplash.png
date: 2018-11-11T09:00:28+00:00
featuredalt : "Penny Pinching: Migrating App Service to Azure Storage Website Hosting - Photo by Katie Harp - Pinterest Manager on Unsplash" 
featuredpath : "/images/2018/AzureStorage"
categories:
  - Azure
  - Development
tags:
  - Azure Storage
  - Azure App Service
  - Hugo
---

I am a very big fan of Azure App Service - the flexibility and power you get from this service always amazes me. But recently Static website hosting in Azure Storage was announced and because of the static nature of this blog it would be an ideal fit! So lets see how the migration goes, right? In this lengthy post I show you how I migrated from Azure App Service to Azure Storage Static Website Hosting, from Deployment to Custom Domain.
<!--more-->

Firstly I checked the [requirements and the notes](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blob-static-website) **Preview** feature. Hosting static files from a storage account - what could go wrong? It is a free feature, too!

It says I need a storage account of kind StorageV2 - so I created one:
{{< fancybox "/images/2018/AzureStorage" "2018-11-08 11_59_38-Configuration - Microsoft Azure.png" "Migrating Azure Storage V1 to V2" "single_image" >}}
*Note: I tried to upgrade an existing V1 storage - enabling the static website feature worked, but I did not get a website url then!*

Then I enable Static website (preview) feature:
{{< fancybox "/images/2018/AzureStorage" "2018-11-08 12_14_01-Static website (preview) - Microsoft Azure.png" "Enable the preview feature: Static website hosting" "single_image" >}}

This gave me the website url: https://melcherit.z6.web.core.windows.net/ - I copied my index.html to the storage account and it worked on the first try:
{{< fancybox "/images/2018/AzureStorage" "StaticWebsite.png" "uploaded my index.html" "single_image" >}}

That is a very promising start.

## Deployment

So building my entire site and uploading it to the storage account and we are set, right? There is even a [VS Code extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurestorage) to do that.

Nope. I am used to create my posts with VS Code and then pushing them to Bitbucket. After the pushs is registered, a [deployment cmd](https://github.com/hxlnt/hugo-on-azure/blob/master/azure-deploy.cmd) file is trigger that pre-compiles my hugo blog posts to html files. That deployment option is not available with Storage Accounts so I need an alternative.
Azure DevOps immediately came to my mind and I gave it a quick go.

1. Push the repository to Azure Repos
2. Create an Azure Pipeline build definition to pre-compile the website
3. Create an Azure Pipeline release definition to copy the website to the storage account

The first task was super easy. Created a new repo in Azure Repo - imported the entire repository (way faster than pushing it myself) and done.
Secondly I checked if there is a build task for Hugo - and surprisingly there is one: [Hugo](https://marketplace.visualstudio.com/items?itemName=giuliovdev.hugo-extension) by Giulio Vian
{{< fancybox "/images/2018/AzureStorage" "build1_hugo_task.png" "Hugo build task" "single_image" >}}
That is super awesome!

So configured my build with that extension and run it:
{{< fancybox "/images/2018/AzureStorage" "build1_hugo_inaction.png" "Hugo build task in action" "single_image" >}}

At first I wondered why there are no build artifacts / output - right, I need to publish them to see it:
{{< fancybox "/images/2018/AzureStorage" "Build2_PublishArtifact.png" "Publish artifact took more than 8 minutes - I am not patient enough for that" "single_image" >}}

Unfortunately that took way too long (blog output is ~1GB with 7700 files) and I guess you would need to be patient for that approach. Actually I dont need to reuse the build output - a simple copy to the Azure Storage would be sufficient. So no classic Build/Release approach, only build for now.

So here comes build #3 - and that instantly failed. There you go, my perfect build history:
{{< fancybox "/images/2018/AzureStorage" "Build3_AzureCopyFailed.png" "Error during copy: Upload to container: '$web' in storage account: 'melcherit' with blob prefix: '' failed with error: 'Azure Storage container names can only contain lowercase alpha-numeric characters or hyphens" "single_image" >}}

Mhh, the container name is $web where the files must be copied to - nothing we can do about it. Before opening a issue for the Azure File Copy task, lets check if there is a new version of it. Indeed - Version 2 is available, here comes build 4:
{{< fancybox "/images/2018/AzureStorage" "Build4_UploadWorked.png" "7731 files uploaded - nice" "single_image" >}}
Only took 45 seconds - acceptable :)

Finally: I only have to redirect my domain to the new storage web endpoint and done? Nope. 
Unfortunately, static website hosting does not support custom domains with SSL - the warning was so obvious that I ignored it:
{{< fancybox "/images/2018/AzureStorage" "AzureStorage_CustomDomainSSL.png" "Ooops - no custom domain and ssl. Thats a must for me." "single_image" >}}

SSL is a must, even for static websites. So I googled if there are other options than the suggestion with the Azure CDN. There is one by [Aaron Wislang](https://www.aaronmsft.com/posts/static-sites-hugo-azure-cloudflare/) that uses Cloudflare Workers to redirect the requests to the Azure Storage. I want to have as much as possible in Azure, so I will try the CDN path. 

So I followed the [guide](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-https-custom-domain-cdn) to create an Azure CDN:
{{< fancybox "/images/2018/AzureStorage" "AzureStorage_CustomDomain.png" "Custom Domain SSL" "single_image" >}}

Remember to set the origin to "custom origin" to set the source of the CDN to your Azure Storage Web Endpoint.
And that seems to work - this blog delivered via the Azure CDN: [melcher.azureedge.net/](https://melcher.azureedge.net).

To have it mapped to my [melcher.it](https://melcher.it) domain I enabled a Custom Domain and started the verification to have a certificate. It took like 4-6 hours until I got a verification email, approved it - and waited again. After like 2 hours, the verification process was finished and I was able to redirect my domain to the CDN. Done.

## Summary

So what did we get here? From a cost perspective I replaced one App Service Plan S1 (61.56€ per month) with one Azure Storage with 1gb with 100k read/write/list (0.96€ per month) and 1gb global traffic (0.62€) - traffic is estimated tho. But with the free Cloudflare CDN that I put in front of my Azure CDN I should be covered :)

So from 61.56€ down to 1.58€ or if you want to have it in percentage: **97% cost reduction!**

Looking at the complexity of the solution: I replaced a rather "stupid" deploy command with Azure DevOps (big like!) and I replaced 1 service with 2 services to cut the cost. 

If that does not work out - you will read it here!
