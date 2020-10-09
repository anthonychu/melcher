---
title: "Azure Policy: Audit Installed Applications"
date: 2018-11-15T09:41:44+01:00
aliases:
   - "/post/2018-11-15-AzurePolicy-InstalledApp/"
2018: "11"
author: "Max Melcher"
categories:
  - Governance
tags:
  - Azure Policy
  - Inventory
hashtags:
  - "#azurepolicy"

featured: "images/featured.png"
featuredalt : "Azure Policy to black list installed applications - Photo by Adam Griffith on Unsplash"
---

Azure Policies are the new silver bullet for all things governance: Last week (November 10, 2018) a new policy was introduced that can audit installed applications inside virtual machines (see [intro post](https://azure.microsoft.com/en-us/updates/azure-policy-now-audits-applications-installed-inside-virtual-machines/)).

I wanted to know wether it is possible to **detect software that should ___not___ be installed**. Imagine you want to discover all servers where a specific version is installed that ran out of support. Or maybe a software that has not been approved yet. There are many of those scenarios.
<!--more-->

This case could have been handled with Azure Automation and Software inventory - but then you would need to add log analytics to all VMs and pay for the data ingestion. Its not much, but if you have lots of VMs then maybe the Azure Policy approach fits better.

{{< fancybox "images" "Automation_Inventory.png" "Azure Automation Inventory" "single_image" >}}


## Audit Installed Software

{{% notice note %}}
Please note: As indicated by the name, the used policies are in **PREVIEW**. Things may not be ready for production, yet!
{{% /notice %}}

The provided Azure Policy initiative "[Preview]: Audit applications inside Windows VMs" is a good starting point. It has two policies, one deploys the Microsoft Guest Configuration. It is required to get the installed software from within the VM.
The other policy then actually checks if a given software is installed. If so, it marks the checked VM as compliant.

I want the exact opposite case. I want to mark it non-compliant if a given software is installed.

To verify my approach, I created a new VM and installed Microsoft SQL Server 2017 - important is, the policy checks for installed software and does not check the file system:
{{< fancybox "images" "SQLServerInstallation.png" "SQL Server installation" "single_image" >}}

Setting up my test system with **azure cli** took me like 15-20 minutes (downloading and installing sql was not automated):
{{< highlight bash >}}
az login
az group create --name SQLAudit --location westeurope
az vm create -g SQLAudit --image Win2012R2Datacenter --size Standard_DS2_v2 -n "SQLAudit" --admin-password "<Password>" --admin-username "<Username>"
az vm open-port --name "SQLAudit" --port 3389 --resource-group SQLAudit
mstsc /v:<PublicIP>
{{< /highlight >}}

Then I started to duplicate the built-in Azure Policy initiative. It took me a while to figure out how to create it with Azure CLI, so here are the commands and json files I used:

{{< highlight bash >}}
az policy definition create --name 'blacklisted-software' --display-name 'Blacklisted Software' --description 'This policy checks if a given software is installed' --rules 'https://melcher.dev/2018/11/azure-policy-audit-installed-applications/CLI/Policy.BlacklistedApplication.json' --mode Indexed
{{< /highlight >}}

This creates an Azure Policy with the name "Blacklisted Software" and is similar to the built-in policy "[Preview]: Deploy VM extension to audit application inside Windows VMs must be present". I only inverted the logic in the very last row and filter on 'Non-compliant' entries:
{{< fancybox "images" "AzurePolicy_NonCompliant.png" "Filter on 'Non-compliant' entries" "single_image" >}}

and the command to create the Azure Policy initiative:
{{< highlight bash >}}
az policy set-definition create -n "Blackelisted Software" --definitions "https://melcher.dev/2018/11/azure-policy-audit-installed-applications/CLI/Policy.VMExtension.json" --params "https://melcher.dev/2018/11/azure-policy-audit-installed-applications/CLI/Policy.Params.json"
{{< /highlight >}}

And lastly the policy assignment:
{{< highlight bash >}}
az policy assignment create --scope "/subscriptions/<ID>" -d "/providers/Microsoft.Authorization/policyDefinitions/<Id of the policy>" --name "Blacklisted Application" --params "https://melcher.dev/2018/11/azure-policy-audit-installed-applications/CLI/Policy.ParamsValue.json"
{{< /highlight >}}

Results in this assignment in the portal:
{{< fancybox "images" "AzurePolicy_Assignment.png" "The assigned policy" "single_image" >}}

Files to download:
[Policy 1](https://melcher.dev/2018/11/azure-policy-audit-installed-applications/CLI/Policy.BlacklistedApplication.json)
[Policy 2](https://melcher.dev/2018/11/azure-policy-audit-installed-applications/CLI/Policy.VMExtension.json)
[Params](https://melcher.dev/2018/11/azure-policy-audit-installed-applications/CLI/Policy.Params.json)

You could even execute my commands - Azure CLI downloads the JSON files from my blog and executes them. In the [Policy 2](https://melcher.dev/2018/11/azure-policy-audit-installed-applications/CLI/Policy.VMExtension.json) file is my subscription id, so it wont work in this case - but the idea is **awesome**. Maybe the policies can be referenced by name instead of id, I'll check that later.

After Azure Policy did its magic (approx. 15 minutes), you can see that it discovered the one test installation of SQL Server in my VM:
{{< fancybox "images" "AzurePolicy_Compliance_Blacklist.png" "Blacklisted Software found" "single_image" >}}

Please note: The policy does not check standard sql images that you can get in the marketplace. This is because the policy "[Preview]: Deploy VM extension to audit application inside Windows VMs must be present" only checks images with the following constraints:
{{< fancybox "images" "AzurePolicy_GuestExtensionFilter.png" "Constraints for the Azure Policy '[Preview]: Deploy VM extension to audit application inside Windows VMs must be present" "single_image" >}}
Basically it must be a standard windows server image, otherwise you have to adjust the first policy.

## Summary

In this article I showed you how to use the new Azure Policy feature to audit installed applications.<br/>You find it as useful as I do?
