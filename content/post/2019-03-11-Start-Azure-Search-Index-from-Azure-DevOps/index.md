---
title: "Start Azure Indexer from Azure DevOps"
date: 2019-03-11T14:35:20+01:00
2019: "03"
author: "Max Melcher"
categories:
  - Azure Search
  - Azure DevOps
tags:
  - CLI
  - PowerShell
featured: "images/AzureDevOps_CICD_AzureSearch.png"
featuredalt : "Run Azure Search indexer during Azure DevOps build"
hashtags:
  - "#azure"
  - "#AzureSearch"
  - "#AzureDevOps"
---

As described in my last post, I switched to Azure Search for my site search. And because I use Azure DevOps for publishing new blog posts, I wanted to trigger an index run from my build pipeline.
<!--more-->

Surprisingly there is no Azure CLI command to trigger an index run, but there is a [REST operation](https://docs.microsoft.com/en-us/rest/api/searchservice/run-indexer) available.
So I quickly created [this PowerShell script](Start-Index.ps1):

{{< highlight powershell >}}
$params = @{
 "api-key"="[ADMIN KEY]";
}

Invoke-WebRequest -Uri https://[SERVICE NAME].search.windows.net/indexers/[INDEXER NAME]/run?api-version=2017-11-11 -Method POST -Headers $params -UseBasicParsing
{{< /highlight >}}
You only have to replace all the [] values.

I then added it to my Azure DevOps build:

{{< fancybox "images" "AzureDevOps_CICD_AzureSearch.png" "Run indexer during AzureDevOps build" "single_image" >}}

I discovered, that if you run this command on self-hosted build agent, then it fails without the -UseBasicParsing switch.

So once a new build is running, the Azure Search index gets updated.

Hope it helps,  
Max