---
title: 'Azure Governance: Govern the Azure Marketplace with Azure Policy'
author: Max Melcher
aliases:
   - "/post/2018-11-09-AzureGovernance-Policy-Marketplace/"
2018: "11"
type: post
image: 
  - /images/2018/AzurePolicyMarketplace/mark-duffel-422279-unsplash.png
featured: mark-duffel-422279-unsplash.png
date: 2018-11-09T09:30:28+00:00
featuredalt : "Azure Governance: Govern the Azure Marketplace with Azure Policy. Photo by Mark Duffel on Unsplash" 
featuredpath : "/images/2018/AzurePolicyMarketplace"
categories:
  - Azure
  - Governance
tags:
  - Azure Marketplace
  - Azure Policy
---

The Azure Marketplace easily enables us to add new types of VMs to any Azure environment. Sometimes those VMs can have additional charges that were not approved. Sometimes those VMs come from a 3rd party source that was not approved. 
Unfortunately the Azure Marketplace can only be disabled or enabled for EA (Enterprise Agreement) customers according to the [Marketplace FAQ](https://azure.microsoft.com/en-in/marketplace/faq/), by now. This situation is far from ideal from a governance perspective.

In this post I will show you how to use the Azure Policy service to audit or even deny the creation of those VMs.
<!--more-->

## Azure Policy

> Azure Policy is a service in Azure that you use to create, assign and, manage policies. These policies enforce different rules and effects over your resources, so those resources stay compliant with your corporate standards and service level agreements. Azure Policy does this by running evaluations of your resources and scanning for those not compliant with the policies you have created. For example, you can have a policy to allow only a certain SKU size of virtual machines in your environment. Once this policy has been implemented, it will then be evaluated when creating and updating resources, as well as over your already existing resources. Later on in this documentation, we will go over more details on how to create and implement policies with Azure policy.
-- https://docs.microsoft.com/en-us/azure/governance/policy/overview

Azure Policy is a really great service to ensure governance in a subscription or even Azure tenant. If you have not heard of this rather new service, then watch the overview video from [Build 2018](https://channel9.msdn.com/events/Build/2018/THR2030). 

## Image Publisher Policy

As long as there is no other way to restrict the Azure Marketplace, I think it will help to limit the usage of items with a given publisher. The publisher can be for example 'Microsoft' for stuff from Microsoft or 'Canonical' for Ubuntu images. Luckily there are plenty of [samples](https://github.com/Azure/azure-policy) to get us started. For my neesd I adjusted one [sample](https://github.com/Azure/azure-policy/tree/56c6f4153a243e68c2a91234b1bb33af7f5bee48/samples/Compute/allowed-image-publishers) so the resulting json is:

{{< highlight json >}}
{
    "if": {
       "allOf": [
          {
             "field": "type",
             "in": [
                "Microsoft.Compute/disks",
                "Microsoft.Compute/virtualMachines",
                "Microsoft.Compute/VirtualMachineScaleSets"
             ]
          },
          {
             "not": {
                "allOf": [
                   {
                      "field": "Microsoft.Compute/imagePublisher",
                      "in": [
                         "Microsoft", "Microsoft-AKS", "Canonical"
                      ]
                   }
                ]
             }
          }
       ]
    },
    "then": {
       "effect": "audit"
    }
 }
{{< /highlight >}}

The very last "then" in the json decides what to do if a resource violates the policy. If the effect is "audit", the resource is shown as not compliant. If the effect is "deny", the creation of the resource is blocked - it does not affect existing resources! *In case you wonder: The publisher of a Azure Kubernetes node is Microsoft-AKS.*

Afterwards, add the policy to Azure with the following CLI command:
{{< highlight bash >}}
az policy definition create --name "AzureMarketplacePolicy" --description "Govern usage of Azure Marketplace resources" --display-name "Azure Marketplace Policy" --mode All --rules "C:\Git\Scripts\Policy\Azure.Marketplace.Rules.json"
{{< /highlight >}}

Adds the policy to the portal like this:
{{< fancybox "/images/2018/AzurePolicyMarketplace" "AzurePolicy.png" "Azure Policy: a policy to govern marketplace resources" "single_image" >}}

Lastly assign the policy to a scope: management groups, subscriptions, resource groups or even resources are possible. With the following command I assign the policy to a subscription:

{{< highlight bash >}}
az policy assignment create --name "AzureMarketplacePolicy" --scope "/subscriptions/XXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXX" --policy "AzureMarketplacePolicy" 
{{< /highlight >}}

The nice thing here is that you can exclude scopes with **\--not-scopes** - that is handy if you for example have multiple subscriptions - and in one there is automatic deployment or DevOPs with Marketplace resources - then you could exclude that subscription.
{{< fancybox "/images/2018/AzurePolicyMarketplace" "AzurePolicy_Exclusions.png" "Azure Policy: Exclusions" "single_image" >}}

After a short while (or multiple refreshs) you can see the policy compliance in the portal:
{{< fancybox "/images/2018/AzurePolicyMarketplace" "AzurePolicy_Compliance.png" "Azure Policy: Compliance" "single_image" >}}

I tried it with several marketplace resources - all of them were shown as not compliant in the portal:
{{< fancybox "/images/2018/AzurePolicyMarketplace" "AzurePolicy_Details.png" "Azure Policy: Compliance Details" "single_image" >}}

In the case of effect "deny" the result is pretty clear - non-compliant resources cannot be created. In the case of "audit" I wish there could be some sort of notification options. Right now I need to check the Policy page to see the compliance - not ideal, but way better than not having any governance in place. Right?
