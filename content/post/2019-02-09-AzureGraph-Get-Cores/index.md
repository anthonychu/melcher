---
title: "Azure Resource Graph: How many CPU cores are used"
date: 2019-02-09T16:41:50-08:00
2019: "02"
author: "Max Melcher"
categories:
  - Azure
tags:
  - Azure Resource Graph
  - Reporting
  - Power Bi
featured: "images/PowerBiResourceGraph.jpg"
featuredalt : ""
hashtags: 
  - "#azure"
---

Recently I was asked how many CPU cores were used in an Azure tenant. The intent of the question was to determine how many VMs could use the [Azure Hybrid Benefit](https://azure.microsoft.com/en-us/pricing/hybrid-benefit/) (AHUB) and to have a general number how many cores are in the cloud compared to onPrem. I thought that should be an easy exercise for Azure Resource Graph - and it is!  
In this post I show you how I got the total count.
<!--more-->

## Azure Resource Graph
Azure Resource Graph is a query language for Azure resources - or with more words: 

>Azure Resource Graph is a service in Azure that is designed to extend Azure Resource Management by providing efficient and performant resource exploration with the ability to query at scale across all subscriptions and management groups so that you can effectively govern your environment. These queries provide the following features:
>
> * Ability to query resources with complex filtering, grouping, and sorting by resource properties.
> * Ability to iteratively explore resources based on governance requirements and convert the resulting expression into a policy definition.
> * Ability to assess the impact of applying policies in a vast cloud environment.

>-- https://docs.microsoft.com/en-us/azure/governance/resource-graph/overview

If you have not used it yet, read the excellent docs how to get started [here](https://docs.microsoft.com/en-us/azure/governance/resource-graph/).

## Getting the CPU cores
So once you have the graph extension added, you can use the following query to export a table of all VMs that you have at least read access to. I use the az cli with PowerShell in VSCode - it's awesome. 

{{< highlight powershell "linenos=table" >}}
az login
az extension add --name resource-graph
az graph query --first 1000 -o tsv -q "project name, size = properties.hardwareProfile.vmSize, properties.licenseType, resourceGroup, subscriptionId, type, properties.storageProfile.osDisk.osType  | where type =~ 'Microsoft.Compute/virtualMachines'" | out-file cores.csv
{{< /highlight >}}

or grab my file [here](cores.azcli).

When you want to know what fields are available, I suggest to go to [resources.azure.com](https://resources.azure.com/) - there you can see all the fields and hierarchies so it is way easier to build your queries.

If you have more than 1000 VMs, you have to use the command multiple times and use the --skip parameter (more details [here](https://docs.microsoft.com/en-us/azure/governance/resource-graph/concepts/work-with-data)) - the docs says that the maximum is 5000, my test only returned 1000 results. Not a big deal, if you know it. 

The exported file can be opened in Excel:
{{< fancybox "images" "ResourceGraphExport.jpg" "The exported VMs with some fields" "single_image" >}}

Unfortunately, the Azure Resource Manager (ARM) does not expose the core count directly, we only get the size of the VM. Merging that with the information of all the available VM sizes from "[Sizes for Windows virtual machines in Azure](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/sizes)" would be really time consuming - but luckily there is a az cli command to get a list:

{{< highlight powershell "linenos=table" >}}
az vm list-sizes -o tsv -l westeurope | out-file numberofcores.csv
{{< /highlight >}}

gets you following:
{{< fancybox "images" "NumberOfCores.jpg" "List of cores per VM" "single_image" >}}

Now we have all the information that we need and can simply VLOOKUP-combine the files in Excel:
{{< fancybox "images" "TotalCores.jpg" "Total cores" "single_image" >}}
Or do the same in Power Bi if you want to have more options:
{{< fancybox "images" "PowerBiResourceGraph.jpg" "Power Bi CPU core reporting" "single_image" >}}

Hope it helps,  
Max