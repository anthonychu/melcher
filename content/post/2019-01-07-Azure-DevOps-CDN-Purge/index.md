---
title: "Azure DevOps: Purge Azure CDN "
date: 2019-01-07T10:00:21+01:00
2019: "01"
author: "Max Melcher"
categories:
  - Blog
  - Azure DevOps
tags:
  - Azure CDN
  - Azure DevOps
  - Performance
  - Hugo
featured: "images/azure-devops-deployment.png"
featuredalt : ""
hashtags: 
  - "#azure"
---

This will be a quick one: In this post I show you how to purge/empty an Azure CDN during an Azure DevOps deployment.
<!--more-->

## The Why

As described in [this post](/2018/11/Penny-Pinching-Migrating-App-Service-to-Azure-Storage-Website-Hosting/), I use the fantastic [Azure Storage Static Website](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blob-static-website) feature to host this blog. SSL is a must, even for static websites - so I have to [use an Azure CDN to get a free certificate](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-https-custom-domain-cdn).
Every deployment rebuilds the entire blog and because of its static nature some artifacts can be cached for a longer duration (days!). But once I publish, I want to ensure that the most recent version is distributed and then cached in the CDN.

## Deployment with Azure DevOps

I am already deploying this blog with Azure DevOps because its super fast and simple to setup - so I adjusted my build pipeline and added one [more CLI](cdn-purge.azcli) task:

{{< highlight bash >}}
#purge everything
az cdn endpoint purge  -g melcherit -n melcher --profile-name melcher --content-paths "/*"
{{< /highlight >}}

More infos about the CLI commands are available [here](https://docs.microsoft.com/en-us/cli/azure/cdn/endpoint?view=azure-cli-latest).

My entire pipeline looks like this:
{{< fancybox "images" "azure-devops-deployment.png" "Deployment pipeline for hugo" "single_image" >}}

or in YAML:
{{< highlight yaml >}}
steps:
- task: AzureCLI@1
  displayName: 'Azure CLI: Purge CDN'
  inputs:
    azureSubscription: '<Subscription>'

    scriptLocation: inlineScript

    inlineScript: |
     #purge everything
     call az cdn endpoint purge  -g melcherit -n melcher --profile-name melcher --content-paths "/*"
{{< /highlight >}}

Unfortunately the Standard Microsoft CDN Profile [does not allow pre-loading of assets](https://docs.microsoft.com/en-us/azure/cdn/cdn-features) - but with the limit of 10 load requests per minute with up to 50 paths loading this blog with 8600 files would take ~18 minutes:

{{< fancybox "images" "azurecdn-limit.png" "Limit of Azure CDN: https://docs.microsoft.com/en-us/azure/cdn/cdn-preload-endpoint 'There's a limit of 10 load requests per minute per CDN profile and 50 concurrent paths can be processed at one time. Each path has a path-length limit of 1024 characters.'" "single_image" >}}

 And that would not make too much sense because the first load after the purge is really fast.

 One small addition to my Azure DevOps pipeline - and it worked on the first try! Big like.