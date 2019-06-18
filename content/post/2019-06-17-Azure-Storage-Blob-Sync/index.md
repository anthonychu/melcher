---
title: "Azure Storage Blob Sync - Updates to AzCopy and Azure CLI"
date: 2019-06-17T18:22:24+02:00
2019: "06"
author: "Max Melcher"
categories:
  - Hugo
  - Azure DevOps
  - Azure CLI
tags:
  - AzCopy
  - AZ CLI
  - Azure CLI
  - Storage
  - Sync
  - Performance
featured: "images/featured.png"
featuredalt : "Azure Storage Blob Sync - Updates to AzCopy and Azure CLI"
hashtags: 
  - "#azure"
---

There is a new **sync API** available in AZCopy v10 that makes me happy - and its already included in Azure CLI: sync a folder or file to Azure blob storage (or vice versa) - in this post I show you how I use this for my blog!
<!--more-->

In version 10 of the [AZCopy](https://docs.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-v10) tool, a new feature was introduced that I was waiting for a long time that solves a simple problem: Sync a folder with Azure blob storage. **Everything that is new or changed in a source folder should be uploaded to a target blob storage** - and - optionally, **files that are no longer required can be removed**. Awesomesauce!

And the same API is now available in [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/?view=azure-cli-latest) ([version >= 2.0.65, released on May 21, 2019](https://github.com/MicrosoftDocs/azure-docs-cli/blob/master/docs-ref-conceptual/release-notes-azure-cli.md#may-21-2019)) - the AZCopy v10 tool is included.

With the following line I publish this blog to Azure Storage:

> az storage blob sync -c $web --account-name melcherit -s "C:\agent\_work\1\s\public"

- --account-name is the storage account name
- -c is the target blob storage container
- -s is the local source folder

Update your [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/?view=azure-cli-latest) (just run the installation again)!

**Warning!**
The Azure CLI command does not allow to specify if destination files should be deleted or not - if you need that control, you have to use the AZCopy v10 tool directly.


The full documentation is here:

- [az storage blob sync](https://docs.microsoft.com/en-us/cli/azure/storage/blob?view=azure-cli-latest#az-storage-blob-sync)
- [AzCopy sync](https://docs.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-blobs#synchronize-files)

## My use cases

I use this to deploy this blog to [Azure Storage Static Website](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blob-static-website) - see details [here](/2019/03/running-hugo-on-azure-for-2-a-month/) - and my deployment did leave files behind that were no longer required. Or in the case I change the case of a file, the change was not replicated to Azure, because Azure blob storage is case-sensitive! That lead to unexpected behavior and simply was not clean. I experimented with deleting the entire container during a deployment, but deleting 2GB files and copying them again, took too long (I am terribly impatient!).

In the past, I used Azure Storage to distribute PowerShell scripts in a customer project - and not being able to sync (especially remove and rename scripts) easily, caused some issues - not great but now solved.

## Usage in Azure DevOps

I automated the deployment of my blog (of course!) and use Azure DevOps for that - once I 'git push' the changes, the Azure Pipeline compiles my blog and copies the file to Azure Storage. Before that, I used the Azure File Copy task (version 3) - and the [sync API wont be supported in this task](https://github.com/microsoft/azure-pipelines-tasks/issues/9157).

I helped myself by using the AzureCLI task (version 1) with the exact same command I showed you above:

{{< fancybox "images" "AzureDevOps_AZCLI_BlobStorageSync.png" "Azure DevOps Blob Storage Sync" "single_image" >}}

> az storage blob sync -c $web --account-name melcherit -s "$(System.DefaultWorkingDirectory)\public"

You can see that during the deployment, both source and target are enumerated and compared. Then files are transferred and deleted - cool. The task needs 22 seconds in my case and compares 3194 files (657MB). The first execution was fun - so much stuff on the blob storage that was no longer required.

**Warning!** That leads to the second warning: The API is powerful - it might make sense to protect yourself by enabling [soft delete](https://docs.microsoft.com/azure/storage/blobs/storage-blob-soft-delete) so you can recover if something went wrong.

So, what are you waiting for?

Hope it helps,  
Max
