---
title: "Enterprise File Shares on Azure"
date: 2020-10-13T14:55:57+02:00
2020: "10"
author: "Max Melcher"
categories:
  - Azure
tags:
  - Azure Files
  - Azure NetApp Files
  - Enterprise File Shares
featured: "images/featured.jpg"
featuredalt : ""
hashtags: 
  - "#azure"
---
# Enterprise File Shares on Azure

My customer has a large on-premises file share environment based on Windows Server File Shares with petabytes of data. The maintenance and operations of those servers sounds like a simple task – but having this in a large and complex infrastructure can be challenging. If the file shares are run by multiple teams, then the overall SLA could be heavily impacted, and the run cost are very high.

Azure has viable alternatives to host files shares – in this post, I want to compare the different services – we will compare [Azure Files](https://docs.microsoft.com/en-us/azure/storage/files/storage-files-introduction) (AZF) and [Azure NetApp Files](https://docs.microsoft.com/en-us/azure/azure-netapp-files/) (ANF) to make the right choice when we migrate to Azure.

I discussed the scenario with [Sebastian Brack](https://www.linkedin.com/in/seb-brack/) – thanks a lot for providing the tables below and providing lots of insights!

## Features

| **Feature** | **Azure NetApp Files** | **Azure Files Premium** |
| --- | --- | --- |
| Native Azure Service, fully managed | Yes | Yes |
| Protocol Compatibility | SMB 2.1/3.0/3.1.1, NFS 3/4.1
 Multiprocotol: SMB+NFSv3 | FileREST, SMB 2.1/3.0, NFS 4.1 ([Preview](https://azure.microsoft.com/en-us/blog/nfs-41-support-for-azure-files-is-now-in-preview/)) |
| Min Size | 4 TiB | 100 GiB |
| Max Volume Size | 100 TiB | 100 TiB |
| Max File Size | 16 TiB | 4 TiB |
| Service Levels / Tiering | Standard 0.124354€/GiB
 Premium 0.248091€/GiB
 Ultra 0.331198€/GiB | Premium 0.162€/GiB+ 0.1375€/GiB Snapshots
|
| Shape Capacity/Performance independently | Yes (Manual-QoS) | No |
| On-Prem Access (Hybrid) | Yes (Express Route, VPN) | Yes (ExpressRoute, VPN, Internet)
 Private Link required ([pricing](https://azure.microsoft.com/en-us/pricing/details/private-link/)) for VPN/ExpressRoute (Private Peering):
 €0.009 per GB In-/Outbound Data ProcessingOr ExpressRoute (Microsoft Peering). |
| [Regional Availability](https://azure.microsoft.com/global-infrastructure/services/?products=netapp,storage) | 22+ regions | 32+ regions |
| Regional Redundancy | LRS equivalent ([99.99% SLA](https://azure.microsoft.com/en-us/support/legal/sla/netapp/v1_1/)) | LRS ([99.9% SLA](https://azure.microsoft.com/en-us/support/legal/sla/storage/v1_5/))
[ZRS](https://docs.microsoft.com/azure/storage/common/storage-redundancy)\* (Asia Southeast, Australia East, Europe North, Europe West, US East, US East 2, US West 2) |
| Geo Redundancy | Yes, [Cross-Region Replication](https://docs.microsoft.com/en-us/azure/azure-netapp-files/cross-region-replication-introduction) (Preview) | No |
| Storage at-rest encryption | Yes (AES 256) | Yes (AES 256) |
| Backup | Incremental Snapshots (4k block), Cross-Region Replication, 3rd party | Incremental Snapshots (file), Azure Backup Integration |
| Snapshot Integration into SMB Client | Yes (Previous Versions + ~snapshot) | Yes (Previous Versions) |
| Snapshot Integration into NFS Client | Yes (.snapshot) | No |
| Snapshot Restore via Portal | Restore to new volume | No |
| Integrated Snapshot Scheduling | Yes (Snapshot Policies) | No |
| Identity-based authentication and authorization | Azure Active Directory Domain Services (Azure AD DS),On-premises Active Directory Domain Services (AD DS) | Azure Active Directory (Azure AD)
 Azure Active Directory Domain Services (Azure AD DS)
 On-premises Active Directory Domain Services (AD DS) via AD Connect |

{{% notice note %}}
please note: the prices are taken from Azure West Europe region for comparison – they may vary depending on the service/region.
{{% /notice %}}

The features table looks quite similar – but the details make this more interesting:

Protocol compatibility is a strength of ANF – more protocols and SMB combined with NFSv3: Some applications require both protocols, especially in an integration scenario. As of writing this, NFS is in Preview for Azure Files.

As of now, you must start with at least 4 TiB for ANF, for AZF it is only 100 GiB – if you only have a small scenario, then AZF scores here.

Hybrid connectivity is another important point for my customer – ANF is fully private with no way to expose it to the internet, AZF is accessible via the internet, privately via Private Link (additional cost!) or via ExpressRoute Microsoft Peering.

## Performance, Throughput

| **Feature** | **Azure NetApp Files** | **Azure Files Premium** |
| --- | --- | --- |
| Transaction &amp; data transfer prices | Included | Included |
| Throughput (single volume/share) | Ultra: 128MiB/s per provisioned TiB (auto)<br/>Premium: 64 MiB/s per provisioned TiB (auto)<br/>Standard: 16MiB/s per provisioned TiB (auto) | Egress: 60MiB/s + 61.44 MiB/s per provisioned TiB<br/> Ingress: 40MiB/s + 40.96 MiB/s per provisioned TiB |
| Shape capacity &amp; performance independently | Yes, Manual-QoS ([preview](https://docs.microsoft.com/en-us/azure/azure-netapp-files/manage-manual-qos-capacity-pool)) | No |
| IOPS (single volume/share) | Not limited explicitly, dependent on throughput &amp; IO Size ([benchmark](https://docs.microsoft.com/en-us/azure/azure-netapp-files/performance-benchmarks-linux) ~460.000)Example:1 IOPS @ 64kb per provisioned GiB Premium16 IOPS @ 4k per provisioned GiB Premium | [Baseline](https://docs.microsoft.com/en-us/azure/storage/files/storage-files-scale-targets#additional-premium-file-share-level-limits): 1 IOPS per provisioned GiB up to 100.000Burst: 3 IOPS per provisioned GiB up to 100.000 |
| File level throughput limit | Unlimited (volume throughput limit) | [Egress](https://docs.microsoft.com/en-us/azure/storage/files/storage-files-scale-targets#file-level-limits) 300MiB/s[Ingress](https://docs.microsoft.com/en-us/azure/storage/files/storage-files-scale-targets#file-level-limits) 200MiB/s |
| File level IOPS limit | Unlimited (volume throughput limit) | [5000 IOPS](https://docs.microsoft.com/en-us/azure/storage/files/storage-files-scale-targets#file-level-limits) |
| Volume/Share Size adjustable | Yes | Yes, [cooldown for decrease @ 24h](https://docs.microsoft.com/en-us/azure/storage/files/storage-files-planning#understanding-provisioning-for-premium-file-shares) |
| Service Level changeable | Yes, cooldown for decrease @ 7 days ([Preview](https://docs.microsoft.com/en-us/azure/azure-netapp-files/dynamic-change-volume-service-level)) | No |
| NFS nconnect | Yes (NFSv3) | No |
| SMB Multichannel | Yes | No |

{{% notice note %}}
Please note: Features and performance may have changed since publishing this post – please verify! For ANF there is a &quot;[What&#39;s new page](https://docs.microsoft.com/en-us/azure/azure-netapp-files/whats-new)&quot;, for AZF you can check [Azure Update](https://azure.microsoft.com/en-us/updates/?query=azure%20files).
{{% /notice %}}

Now let us look at the service level. ANF is more flexible, file shares can be divided in 3 performance tiers, AZF has two tiers. If you provision large, 100 TB shares with ANF, you get 1600 MiB/s throughput with the standard tier – even for single files (file level throughput depending on volume size or manual quota). The flexibility on the ANF side is a big benefit.

Changing the service level on ANF can be done – please be aware of the cooldown period. Doing the same for AZF is possible, but its not as easy as with ANF.

The last two rows are very important regarding performance – both nconnect and multichannel allow to have multiple connections to the same to ANF drastically improving the bandwidth. Great stuff.

## Hybrid Connectivity &amp; Encryption

| **Feature** | **Azure NetApp Files** | **Azure Files Premium** |
| --- | --- | --- |
| SMB signing | Yes |
| SMB in-flight encryption | [No](https://docs.microsoft.com/en-us/azure/azure-netapp-files/azure-netapp-files-faqs#can-the-network-traffic-between-the-azure-vm-and-the-storage-be-encrypted) | Yes |
| NFS in-flight encryption | Yes | No |
| Active Directory Integration | Yes | Yes |
| Azure Active Directory Independent | Yes | No ([AD-Connect required](https://docs.microsoft.com/en-us/azure/storage/files/storage-files-identity-auth-active-directory-enable#supported-scenarios-and-restrictions)) |
| AD Kerberos Authentication | Yes (AES 256, AES128, DES) | Yes (AES 256) |
| AD LDAP Signing | Yes |

Comparing the identity aspects, then both integrate into a on-premises Active Directory. AZF requires to have the identities synced to Azure Active Directory (AAD), ANF directly integrates into Active Directory.

Encryption-wise, AZF supports SMB encryption – ANF does not have this yet.

Many things to consider - if you have questions, please don't hesitate to ask.

Hope it helps,  
Max