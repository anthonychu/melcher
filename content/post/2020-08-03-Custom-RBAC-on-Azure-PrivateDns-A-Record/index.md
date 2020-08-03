---
title: "Custom RBAC on Azure PrivateDns A-Record"
date: 2020-08-03T16:21:06+02:00
2020: "08"
author: "Max Melcher"
categories:
  - Azure
tags:
  - PrivateDNS
featured: "images/privatednszone_a_record.png"
featuredalt : ""
hashtags: 
  - "#azure"
---

In this post I want to show how to delegate the management of A-records in an Azure Private DNS zone to a specific user. <!--more-->

Private DNS zones become super relevant when you are in a hybrid environment and want to use [Private Endpoints](https://docs.microsoft.com/en-us/azure/private-link/private-endpoint-overview). If you are in this situation, I can highly recommend you the great overview of my colleague [Daniel Mauser](https://www.linkedin.com/in/danmauser/)'s "[Private Endpoint DNS Integration Scenarios](https://github.com/dmauser/PrivateLink/tree/master/DNS-Integration-Scenarios) - it's the most complete documentation out there, a must read if you want to resolve Azure resources from onPrem.

## Context

In our scenario we use a hub & spoke architecture and users get a spoke with contributor permissions. So they put their apps there and configure them to their needs. But - DNS and all network connectivity will be managed centrally in the hub - where the user has no permissions. The Private DNS zone is in the hub, e.g. for blob storage this would be **privatelink.blob.core.windows.net**. So once they configured the private endpoint connection for their Azure service, they need to put the A record in the central zone to make it resolvable from onPrem, e.g. **mamelchtest.blob.core.windows.net** pointing to **10.16.3.5** - the private endpoint IP of the storage account. The storage account can then be accessed via VPN or ExpressRoute - if the DNS resolution onPrem can resolve the resources on Azure (again, see [Private Endpoint DNS Integration Scenarios](https://github.com/dmauser/PrivateLink/tree/master/DNS-Integration-Scenarios)).

## Implementation
Luckily, the Private DNS zone is granular so that the individual records can have their own role-based access controls (RBAC):
{{< fancybox "images" "RBAC_A-Record.png" "role-based access controls on A-record" "single_image" >}}

So after creating the A-record, we needed to grant permissions to the user and hand-over the management of the record and basically the responsibility of maintaining it. If you would need to manage all records centrally, then this would simply not scale - still, we need to ensure that they do not delete records to keep everything in sync. 

## RBAC

So we created a custom role with the following permissions:

{{< highlight json >}}
"permissions": [
            {
                "actions": [
                    "Microsoft.Network/privateDnsZones/read",
                    "Microsoft.Network/privateDnsZones/write",
                    "Microsoft.Network/privateDnsZones/A/read",
                    "Microsoft.Network/privateDnsZones/A/write"
                ],
                "notActions": [
                    "Microsoft.Network/privateDnsZones/A/delete"
                ],
                "dataActions": [],
                "notDataActions": []
            }
        ]
{{< /highlight >}}

Dont forget to give the user **read access** to Private DNS zone so they can see that in the hub.

At first we tried it without "Microsoft.Network/privateDnsZones/read", "Microsoft.Network/privateDnsZones/write" - but then the update of the record did not work. As this does not mean that user can create new records or delete existing ones this is an acceptable solution.


Hope it helps,  
Max