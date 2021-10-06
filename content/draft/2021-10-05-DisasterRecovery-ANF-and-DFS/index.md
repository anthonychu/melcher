---
'2021': '10'
title: Disaster Recovery for Enterprise File Shares
date: '2021-10-06T13:24:40.349Z'
author: Max Melcher
categories:
  - Azure NetApp Files
tags:
  - ANF
  - Azure NetApp Files
  - DFS
  - DFS Namespaces
  - DR
  - Disaster Recovery
  - Cross-Region Replication
featured: images/image1.png
featuredalt: ''
hashtags:
  - '#azure'
lastmod: '2021-10-06T13:24:21.118Z'
slug: disaster-recovery-enterprise-file-shares
description: |-
  In this article we configure Azure NetApp
  Files and [Windows
  Server DFS
  Namespaces
  to have resilient Enterprise File Shares.
---

In this article we configure [Azure NetApp
Files](https://azure.microsoft.com/de-de/services/netapp/) and [Windows
Server DFS
Namespaces](https://docs.microsoft.com/en-us/windows-server/storage/dfs-namespaces/dfs-overview)
to have resilient Enterprise File Shares. The file shares and the
corresponding data will be replicated, so in case of a regional
disruption, access to the shares can be transparently redirected to a
secondary region.
<!--more-->

{{< blockquote author="" link="https://techcommunity.microsoft.com/t5/azure-architecture-blog/disaster-recovery-for-enterprise-file-shares/ba-p/2808757" >}}
  This article was created in collaboration with [Arnt de Gier
(NetApp)](https://www.linkedin.com/in/arntdegier/) and also posted on the Azure Architecture Blog.
{{< /blockquote >}}


These file shares can be used in either applications, or home- or
team-drives, and virtual desktop environments that must be resilient to
regional disruption or service maintenance events.

With Azure NetApp Files and Cross-Region Replication combined with
Windows Server Distributed File System Namespaces (DFS Namespaces),
businesses can prepare for disasters and recover in a second region.

[Cross-Region
replication](https://docs.microsoft.com/en-us/azure/azure-netapp-files/cross-region-replication-introduction)
is, at the time of writing this post, in Preview. You need to [request
access](https://aka.ms/anfcrrpreviewsignup) to use this feature.

## Infrastructure Overview

For this post, we assume you have one subscription. All the needed
components will be created step-by-step. You can use your existing
on-premises Active Directory infrastructure or build one in the cloud.

We start by creating a Virtual Network (VNET) in the primary region, we
choose Germany West Central:

{{< fancybox "images" "image2.png" "2" "single_image" >}}

As Address Space we create two subnets, one for VMs and one for Azure
NetApp Files (ANF) with a CIDR size of /28.

{{< fancybox "images" "image3.png" "3" "single_image" >}}

Then we create a second VNET in the secondary region. We choose France
Central for our example:

{{< fancybox "images" "image4.png" "4" "single_image" >}}

Then we create the Active Directory Servers in the primary region:

{{< fancybox "images" "image5.png" "5" "single_image" >}}

We add the VM to the primary VNET:

{{< fancybox "images" "image6.png" "6" "single_image" >}}

Next we create a secondary Active Directory Domain Controller in the
secondary region:

{{< fancybox "images" "image7.png" "7" "single_image" >}}

And place it in the secondary VNET:

{{< fancybox "images" "image8.png" "8" "single_image" >}}

To build a Domain Forest, replicating a domain across regions, we [peer
the
VNETs](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-peering-overview)
to enable direct communication of the two Active Directory Domain
Controllers: {{< fancybox "images" "image9.png" "9" "single_image" >}}

This is the list of the resources we deployed so far:
{{< fancybox "images" "image10.png" "10" "single_image" >}}

# Domain Forest & DFS Namespace

> DFS Namespaces is a role service in Windows Server that enables you to
> group shared folders located on different servers into one or more
> logically structured namespaces. This makes it possible to give users
> a virtual view of shared folders, where a single path leads to files
> located on multiple servers

Next, we promote the servers to Active Directory Domain Controllers by
installing the Active Directory Domain Services feature. Additionally,
we install the [DFS
Namespace](https://docs.microsoft.com/en-us/windows-server/storage/dfs-namespaces/dfs-overview)
feature to allow grouping shares on different servers behind a single
path.

{{< fancybox "images" "image11.png" "11" "single_image" >}}
{{< fancybox "images" "image12.png" "12" "single_image" >}}

Next, we promote the server to a Domain Controller and create a new
domain contoso.com:

{{< fancybox "images" "image13.png" "13" "single_image" >}}

We also promote the secondary VM to a domain controller and join this
the existing domain contoso.com:

{{< fancybox "images" "image14.png" "14" "single_image" >}}
{{< fancybox "images" "image15.png" "15" "single_image" >}}

Next, we create an Azure NetApp account in the primary region:

{{< fancybox "images" "image16.png" "" "single_image" >}}

We add a capacity pool of 4 TB Premium storage:

{{< fancybox "images" "image17.png" "" "single_image" >}}

Then we configure the Active Directory Domain Settings with the private
IP of the primary Domain Server that we created earlier:

{{< fancybox "images" "image18.png" "" "single_image" >}}

Before we can create the first share, we need to
[delegate](https://docs.microsoft.com/en-us/azure/azure-netapp-files/azure-netapp-files-delegate-subnet)
the ANF subnet to Azure NetApp/volumes:

{{< fancybox "images" "image19.png" "" "single_image" >}}

And repeat this for the secondary VNET:

{{< fancybox "images" "image20.png" "" "single_image" >}}

Afterwards, we create a first volume in the primary region:

{{< fancybox "images" "image21.png" "" "single_image" >}}

We use SMB and select the Active Directory configuration:

{{< fancybox "images" "image22.png" "" "single_image" >}}

And repeat this for the Azure NetApp account in the secondary region:

{{< fancybox "images" "image23.png" "" "single_image" >}}

Joining the Azure NetApp Files account to the secondary Domain
Controller in the secondary region:

{{< fancybox "images" "image24.png" "" "single_image" >}}

And create a new capacity pool in the secondary ANF.

Please note: the performance tier must not be equal to the source
volume. In this example the primary has Premium performance, the
secondary has standard performance:

{{< fancybox "images" "image25.png" "" "single_image" >}}

Then we create a protection volume in the secondary region:

{{< fancybox "images" "image26.png" "" "single_image" >}}

Select SMB as protocol and the secondary VNET:

{{< fancybox "images" "image27.png" "" "single_image" >}}

Next, we need to authorize the replication from the source to the
destination. For this we need the Resource ID of the source volume. You
can get this from the Properties blade of the source volume:

{{< fancybox "images" "image29.png" "" "single_image" >}}

And added to the protection volume settings. We chose 10 minutes as
replication schedule:

{{< fancybox "images" "image30.png" "" "single_image" >}}

Next, we need to copy the Resource ID of the destination volume to
authorize the replication:

{{< fancybox "images" "image32.png" "" "single_image" >}}

And authorize the replication in the source volume by providing the
Resource ID of the destination volume:

{{< fancybox "images" "image33.png" "" "single_image" >}}

The replication will then start and replicate the volume from the
primary to the secondary region:

{{< fancybox "images" "image35.png" "" "single_image" >}}

## Configuration of DFS Namespace: 

Next, we create a DFS Namespace to point to the share in the primary
region:

{{< fancybox "images" "image36.png" "" "single_image" >}}

And host the Namespace on the primary Domain Controller:

{{< fancybox "images" "image37.png" "" "single_image" >}}

And then add the namespace on the secondary Domain Controller as well:
{{< fancybox "images" "image38.png" "" "single_image" >}}

Lastly, we add a new folder to the namespace. We name it Vol1 and point
it to the primary ANF volume by using the mount path that we can see in
the Azure Portal:

{{< fancybox "images" "image39.png" "" "single_image" >}}

Adding the new folder with the source mount path:

{{< fancybox "images" "image40.png" "" "single_image" >}}

## Replication Test

The file share is now available through the path
\\\\contoso.com\\share1\\vol1:

{{< fancybox "images" "image41.png" "" "single_image" >}}

Every change of a file or folder will then be replicated based on the
replication schedule.

We can confirm this by mounting the replicated volume in the secondary
region. The data is available in read-only mode there:


{{< fancybox "images" "image42.png" "" "single_image" >}}

## Fail-Over Test

For failing-over to the secondary region, we need to do two steps:

1.  Break the replication on the ANF volume

2.  Change the target in the DFS namespace to point to the volume in the
    secondary region

We break the peering on the primary volume:

{{< fancybox "images" "image43.png" "" "single_image" >}}

The secondary volume now becomes writable.

In the DFS namespace we change the target of the share to the secondary
volume:

{{< fancybox "images" "image44.png" "" "single_image" >}}

{{< fancybox "images" "image45.png" "" "single_image" >}}

The DFS Namespace now points to the secondary volume.

The great benefit of this is that the fail-over is transparent to the
user, the access path does not change. Because the data is replicated
continuously, we can also test the disaster recovery at any given time
and ensure the process and availability of the files.

{{< fancybox "images" "image46.png" "" "single_image" >}}

## Summary

In this blog post we showed, end to end, how to configure a resilient
File Share environment with Azure NetApp Files Cross-Region replication.
Additionally, we did a fail-over to the secondary region by leveraging
the DFS Namespace feature available in Windows Server.

In case you have questions or feedback, please leave a comment.
