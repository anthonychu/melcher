---
title: "Quick tip: Use Terraform to secure SSH/RDP connections to Azure VMs"
date: 2019-03-27T15:21:45+01:00
2019: "03"
author: "Max Melcher"
categories:
  - Azure
  - Terraform
tags:
  - NSG
  - Terraform
  - Azure
  - Security
  - Network Security Group
  - Firewall
featured: "images/featured.png"
featuredalt : ""
hashtags: 
  - "#azure"
  - "#terraform"
---

I don't want to expose VMs to the entire internet - and neither should you. That is basically an invite to brute force attack the VM.
Therefore, if I don't use a VPN or Express Route connection to use private IPs, I use Network Security Groups (NSG) to control the traffic to VMs by allowing a single source IP.

In this post, I show how I do that with Terraform.
<!--more-->

## Source IP and NSGs

The service [ipify.org](https://api.ipify.org/) returns your current IP:
{{< fancybox "images" "IPIFY-current-ip.png" "IPIFY.org returns your current IP" "single_image" >}}

This IP can then be used to configure a data provider in Terraform:

{{< highlight bash >}}
# Request your IP 
data "http" "myip" {
  url = "https://api.ipify.org/"
}
{{< /highlight >}}

Next up we want to use the data in an NSG rule to allow SSH (port 22) connections only from that IP:

{{< highlight bash >}}
# Create Network Security Group and rule
resource "azurerm_network_security_group" "onprem-nsg" {
    name                = "nsg"
    #provide a value for the location
    location            = ""
    #provide a value for the resource group
    resource_group_name = ""

    #Provision a security rule with your current IP as a source filter
    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "${chomp(data.http.myip.body)}"
        destination_address_prefix = "*"
    }
}
{{< /highlight >}}

The same approach can, of course, be used for other ports and protocols.

Once you execute/**terraform apply** that script, only connections from a single source IP are allowed. If your source IP changes, you must re-apply the scripts.

Hope it helps,  
Max