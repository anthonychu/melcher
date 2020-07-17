---
title: "Azure Metadata Service or: I lost my VM, where is it?"
date: 2020-07-17T19:05:29+02:00
2020: "07"
author: "Max Melcher"
categories:
  - Azure
tags:
  - metadata
  - TIL
featured: "images/metadata_ubuntu.png"
featuredalt : "Get the subscription id from inside a VM"
hashtags: 
  - "#azure"
---

Ever lost track in what subscription your VM on Azure runs? Too many RDP profiles or SSH sessions and now you want to know where the VM resides or how it is configured? This short post tells you how to get this metadata from inside a VM. <!--more-->

## Azure Instance Metadata Service

The [Azure Instance Metadata Service](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/instance-metadata-service)  is a powerful, but not really well known service that can be really helpful. 
I just got access to a linux VM running on Azure and wanted to know how its configured - but my contact person was not available. Then I recalled that Azure has a metadata service that you can query from inside of the VM to get the details.
This inspired me to write this post.

Azure Instance Metadata Service from [docs.microsoft.com]():
<blockquote>
The Azure Instance Metadata Service (IMDS) provides information about currently running virtual machine instances and can be used to manage and configure your virtual machines. This information includes the SKU, storage, network configurations, and upcoming maintenance events. For a complete list of the data that is available, see metadata APIs. Instance Metadata Service is available for both the VM and virtual machine scale set Instances. It is only available for running VMs created/managed using Azure Resource Manager.  
-- https://docs.microsoft.com/en-us/azure/virtual-machines/windows/instance-metadata-service
</blockquote>

In short: you query the well known IP 169.254.169.254 and get metadata back. 

### Ubuntu / RHEL / Linux
Lets use that on Ubuntu or RHEL or what ever linux flavor you run:
{{< highlight bash >}}
curl -H Metadata:true --noproxy "*" "http://169.254.169.254/metadata/instance?api-version=2019-06-01" | json_pp
{{< /highlight >}}

Results in the following JSON:
{{< highlight json >}}
{
   "compute" : {
      "resourceGroupName" : "perf",
      "plan" : {
         "publisher" : "",
         "product" : "",
         "name" : ""
      },
      "placementGroupId" : "",
      "platformUpdateDomain" : "0",
      "version" : "18.04.202007081",
      "sku" : "18.04-LTS",
      "provider" : "Microsoft.Compute",
      "vmSize" : "Standard_E2ds_v4",
      "platformFaultDomain" : "0",
      "osType" : "Linux",
      "tags" : "",
      "zone" : "",
      "location" : "northeurope",
      "publisher" : "Canonical",
      "offer" : "UbuntuServer",
      "publicKeys" : [
         {
            "path" : "/home/mamelch/.ssh/authorized_keys",
            "keyData" : "[redacted]"
         }
      ],
      "customData" : "",
      "azEnvironment" : "AzurePublicCloud",
      "storageProfile" : {
         "imageReference" : {
            "id" : "",
            "publisher" : "Canonical",
            "offer" : "UbuntuServer",
            "version" : "latest",
            "sku" : "18.04-LTS"
         },
         "osDisk" : {
            "caching" : "ReadWrite",
            "vhd" : {
               "uri" : ""
            },
            "encryptionSettings" : {
               "enabled" : "false"
            },
            "name" : "perf2_OsDisk_1_b6e097a5c44d4f0f95fad2e98375139d",
            "image" : {
               "uri" : ""
            },
            "createOption" : "FromImage",
            "diskSizeGB" : "30",
            "writeAcceleratorEnabled" : "false",
            "managedDisk" : {
               "storageAccountType" : "Premium_LRS",
               "id" : "/subscriptions/36d3ff36-dc30-4224-9970-6c24b9043705/resourceGroups/PERF/providers/Microsoft.Compute/disks/perf2_OsDisk_1_b6e097a5c44d4f0f95fad2e98375139d"
            },
            "osType" : "Linux"
         },
         "dataDisks" : []
      },
      "vmId" : "283f76e9-d830-4ed0-b889-e2c580d5fac8",
      "subscriptionId" : "36d3ff36-dc30-4224-9970-6c24b9043705",
      "resourceId" : "/subscriptions/36d3ff36-dc30-4224-9970-6c24b9043705/resourceGroups/perf/providers/Microsoft.Compute/virtualMachines/perf2",
      "vmScaleSetName" : "",
      "name" : "perf2"
   },
   "network" : {
      "interface" : [
         {
            "ipv6" : {
               "ipAddress" : []
            },
            "macAddress" : "000D3A650A84",
            "ipv4" : {
               "subnet" : [
                  {
                     "prefix" : "24",
                     "address" : "172.16.4.0"
                  }
               ],
               "ipAddress" : [
                  {
                     "privateIpAddress" : "172.16.4.4",
                     "publicIpAddress" : "[redacted]"
                  }
               ]
            }
         }
      ]
   }
}
{{< /highlight >}}

Thats a lot and super helpful. Subscription Id, Location, Resource Group, Update/Fault Domain - even the disk setup is presented - very cool!

To just get the subscription id you can use this query: 
{{< highlight bash >}}
curl -H Metadata:true --noproxy "*" "http://169.254.169.254/metadata/instance/compute/subscriptionId?api-version=2019-06-01&format=text"
{{< /highlight >}}

### Windows

and for Windows in PowerShell you can use the following one-liner:

{{< highlight powershell >}}
Invoke-RestMethod -Headers @{"Metadata"="true"} -Method GET -Uri "http://169.254.169.254/metadata/instance/compute/subscriptionId/?api-version=2019-06-01&format=text"
{{< /highlight >}}

{{< fancybox "images" "metadata_windows.png" "Metadata service to get the subscription id from inside a windows VM" "single_image" >}}

Cool, right?
