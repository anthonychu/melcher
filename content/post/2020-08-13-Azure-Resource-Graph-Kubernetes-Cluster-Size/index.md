---
title: "Azure Resource Graph: Getting node sizes and node count of all kubernetes clusters"
date: 2020-08-13T16:04:21+02:00
2020: "08"
author: "Max Melcher"
categories:
  - Azure
tags:
  - Resource Graph
  - Kubernetes
  - AKS
featured: "images/AzureResourceGraphKubernetesSize.png"
featuredalt : "Azure Resource Graph Kubernetes Size"
hashtags: 
  - "#azure"
---

Today I wanted to quickly see how many Azure clusters there are in an azure environment, their node size and count.
<!--more-->

## Azure Resource Graph

<blockquote>
Azure Resource Graph is a service in Azure that is designed to extend Azure Resource Management by providing efficient and performant resource exploration with the ability to query at scale across a given set of subscriptions so that you can effectively govern your environment.
-- https://docs.microsoft.com/en-us/azure/governance/resource-graph/overview
</blockquote>

If you are not familiar with Azure Resource Graph - the [documentation](https://docs.microsoft.com/en-us/azure/governance/resource-graph/overview) is great. It took a couple of attempts and a little bit of fiddling, but with the following query gives you all the clusters you have access to and their corresponding size:

{{< highlight bash >}}
Resources
 | where type == "microsoft.containerservice/managedclusters"
 | extend properties.agentPoolProfiles
 | project subscriptionId, name, pool = (properties.agentPoolProfiles)
 | mv-expand pool
 | project subscription = subscriptionId, cluster = name, size = pool.vmSize, count = pool.['count']
{{< /highlight >}}

and the result is the following table:
{{< fancybox "images" "AzureResourceGraphKubernetesSize.png" "Azure Resource Graph to query all kubernetes clusters, their size and count" "single_image" >}}

Can be directly executed with the following [link](https://portal.azure.com/?feature.customportal=false#blade/HubsExtension/ArgQueryBlade/query/Resources%0A%20%7C%20where%20type%20%3D%3D%20%22microsoft.containerservice%2Fmanagedclusters%22%0A%20%7C%20extend%20properties.agentPoolProfiles%0A%20%7C%20project%20subscriptionId%2C%20name%2C%20pool%20%3D%20%28properties.agentPoolProfiles%29%0A%20%7C%20mv-expand%20pool%0A%20%7C%20project%20subscription%20%3D%20subscriptionId%2C%20cluster%20%3D%20name%2C%20size%20%3D%20pool.vmSize%2C%20count%20%3D%20pool.%5B%27count%27%5D).

The 'escaping' of the .count took me a while to figure out.

Hope it helps,  
Max