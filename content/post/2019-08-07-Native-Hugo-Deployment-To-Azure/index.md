---
title: "Native Hugo deployment to Azure"
date: 2019-08-07T10:47:56+02:00
2019: "08"
author: "Max Melcher"
categories:
  - Azure
  - Hugo
tags:
  - Azure CLI
featured: "images/hugodeploy.gif"
featuredalt : ""
hashtags: 
  - "#azure"
---

In Hugo version 0.56 a native deployment command was introduced to deploy your blog/website to various cloud providers - one of them is Azure. In this post I show how I simplified my deployment pipeline with this command.

## Hugo deploy

The Hugo deploy command uses [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest) and your config.toml / config.yaml file and checks for a [deployment] section.
Additionally, you need to have two environment variables present - even tho the [documentation](https://gohugo.io/hosting-and-deployment/hugo-deploy/#assumptions) says you have to use **az login** (thats incorrect, it works without). That has the benefit that your config file does not have the secrets and you can still publicly store it on github.

## Environment Variables
You must have the environment variable **AZURE_STORAGE_ACCOUNT** and one of the following: **AZURE_STORAGE_KEY** or **AZURE_STORAGE_SAS_TOKEN**. 

In powershell you can configure them like this: 
{{< highlight powershell >}}
$Env:AZURE_STORAGE_ACCOUNT = "<AccountName>"
$Env:AZURE_STORAGE_KEY = "<AccountKey>"
{{< /highlight >}}

Or if you want to have it dynamic - that requires you to be logged in with Azure CLI:
{{< highlight powershell >}}
$Env:AZURE_STORAGE_ACCOUNT = "<AccountName>"
$Env:AZURE_STORAGE_KEY = az storage account keys list -n <AccountName> --query [0].value -o tsv
{{< /highlight >}}

## Deployment Configuration

My deployment configuration looks like this:

{{< highlight toml >}}
[deployment]
order = [".jpg$", ".gif$"]

[[deployment.targets]]
name = "azure"

# Azure Blob Storage; see https://gocloud.dev/howto/blob/#azure
URL = "azblob://$web"

[[deployment.matchers]]
#  Cache static assets for 20 years.
pattern = "^.+\\.(js|css|svg|ttf)$"
cacheControl = "max-age=630720000, no-transform, public"
gzip = true

[[deployment.matchers]]
pattern = "^.+\\.(png|jpg)$"
cacheControl = "max-age=630720000, no-transform, public"
gzip = false

[[deployment.matchers]]
pattern = "^.+\\.(html|xml|json)$"
gzip = true
{{< /highlight >}}

## And in action

{{< fancybox "images" "hugodeploy.gif" "Hugo native deployment to Azure" "single_image" >}}

## Simplified deployment with Azure DevOps

As described in the post [RUNNING HUGO ON AZURE FOR 2$ A MONTH](/2019/03/running-hugo-on-azure-for-2-a-month/), I use Azure DevOps to automatically deploy Hugo to Azure and have everything version-controlled. My old pipeline did the following:

* Generate Hugo content
* Sync the content to Azure Storage (upload new files, delete no longer required files)
* Set the cache header of files
* Purge the Azure CDN 
* Index the content with Azure Search

{{< fancybox "images" "Hugo_AzureDevOps_Deployment.png" "My Azure DevOps pipeline to deploy hugo on Azure" "single_image" >}}

I could combine the sync and cache header job with the Hugo native deployment - but as of know, the build task that I use, [does not support that](https://github.com/giuliov/hugo-vsts-extension/issues/13).

## Update (August 19th, 2019)

I could not wait until the hugo extension is implementing the deploy command, so I thought lets try to use it with the PowerShell tasks of Azure DevOps.

My build server is a windows server (see post "[SELF-HOSTED AZURE DEVOPS BUILD/RELEASE AGENT WITH TERRAFORM - WINDOWS-EDITION](/2019/03/self-hosted-azure-devops-build/release-agent-with-terraform-windows-edition/)") and I installed [Hugo on it with Chocolatey](https://chocolatey.org/packages/hugo).
Then I used a powershell task to execute both the 'hugo' publish  and the 'hugo deploy' command - and it worked straight out of the box!

{{< fancybox "images" "hugo_Native_AzureDevOps.png" "Hugo-native Azure DevOps deployment" "single_image" >}}

And the commands in a copy&paste-friendly version:
{{< highlight powershell >}}
#publish
hugo --source $(Build.SourcesDirectory) --destination $(Build.SourcesDirectory)\public  --enableGitInfo --i18n-warnings --verbose --cleanDestinationDir

#deploy
$Env:AZURE_STORAGE_ACCOUNT = "<storageaccount>"
$Env:AZURE_STORAGE_KEY = "<storageaccountkey>"
hugo deploy azure --maxDeletes -1
{{< /highlight >}}

Afterwards I installed the [chocolatey task](https://marketplace.visualstudio.com/items?itemName=gep13.chocolatey-azuredevops) to update Hugo to the latest version if there is one - that is not yet tested.
Incremental deployment takes roughly 1 minute (for 1094 pages, 650MB) - thats awesome, right?

{{< fancybox "images" "Hugo_AzureDevOps_Tasks.png" "1 minute to release a new post - big like!" "single_image" >}}

For local testing, the native deployment is great, too!

Hope it helps,  
Max