---
title: "Self-Hosted Azure DevOps Build/Release Agent with Terraform - Windows-Edition"
date: 2019-03-12T15:27:21+01:00
2019: "03"
author: "Max Melcher"
aliases:
   - "/tfazuredevopswin"
categories:
  - Azure
  - Terraform
  - Azure DevOps
tags:
  - Automation
  - Custom Script Extension
  - Azure
  - Terraform
  - Azure DevOps
  - Self-Hosted Build-Agent
featured: "images/featured2.png"
featuredalt : "Azure DevOps Build/Release agent with terraform running on Windows Server 2016"
hashtags: 
  - "#azure"
  - "#terraform"
---

In February I created a [Azure DevOps Build/Release agent with terraform running on Ubuntu](/tfazuredevops) and due to many requests, here is the terraform script to do the same, but on a Windows Server.
<!--more-->

## The Terraform Script

The Terraform script is pretty much the same as for the Ubuntu one - and the comments inside are hopefully self-explaining. If not, please leave a comment.

[Download the whole script](azuredevops_win.tf) and the [variable file](terraform.tfvars).
{{< highlight bash "linenos=table" >}}
#Specify Resource Group
variable "resourcegroup" {
  type    = "string"
  description = "Specify the resource group where the VM should be created"
}

variable "location" {
  type    = "string"
  description = "Specify the location where the resources should be created, e.g. westeurope"
}

#Replace [Organization] https://dev.azure.com/[Organization]/_usersSettings/tokens
variable "url" {
  type = "string"
  description = "Specify the Azure DevOps url e.g. https://dev.azure.com/mmelcher"
}

#Create via https://dev.azure.com/[Organization]/_usersSettings/tokens
variable "pat" {
  type = "string"
  description = "Provide a Personal Access Token (PAT) for Azure DevOps"
}

#The build agent pool. Create it via https://dev.azure.com/[Organization]/_settings/agentpools?poolId=8&_a=agents
variable "pool" {
  type = "string"
  description = "Specify the name of the agent pool - must exist before"
}

#The name of the agent
variable "agent" {
  type = "string"
  description = "Specify the name of the agent"
}

variable "size" {
  type    = "string"
  description = "Specify the size of the VM"
}

variable "hostname" {
  type    = "string"
  description = "Specify the hostname of the VM"
}

variable "admin_username" {
  type    = "string"
  description = "Specify the admin username of the VM"
}

variable "admin_password" {
  type    = "string"
  description = "Specify the admin username of the VM"
}

# Create a resource group if it doesn’t exist
resource "azurerm_resource_group" "azuredevops" {
  name     = "${var.resourcegroup}"
  location = "${var.location}"

  tags {
    environment = "AzureDevOps"
  }
}

# Create virtual network
resource "azurerm_virtual_network" "azuredevopsnetwork_win" {
  name                = "AzureDevOpsVnet_Win"
  address_space       = ["10.200.0.0/16"]
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.azuredevops.name}"

  tags {
    environment = "AzureDevOps"
  }
}

# Create subnet
resource "azurerm_subnet" "azuredevopssubnet_win" {
  name                 = "AzureDevopsSubnet_Win"
  resource_group_name  = "${azurerm_resource_group.azuredevops.name}"
  virtual_network_name = "${azurerm_virtual_network.azuredevopsnetwork_win.name}"
  address_prefix       = "10.200.2.0/24"
}

# Create public IPs
resource "azurerm_public_ip" "azuredevopspublicip_win" {
  name                = "AzureDevOpsPublicIP_Win"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.azuredevops.name}"
  allocation_method   = "Dynamic"

  tags {
    environment = "AzureDevOps"
  }
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "azuredevopsnsg" {
  name                = "AzureDevOpsNetworkSecurityGroup"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.azuredevops.name}"

  tags {
    environment = "AzureDevOps"
  }
}

# Create network interface
resource "azurerm_network_interface" "azuredevopsnic_win" {
  name                      = "AzureDevOpsNIC_win"
  location                  = "${var.location}"
  resource_group_name       = "${azurerm_resource_group.azuredevops.name}"
  network_security_group_id = "${azurerm_network_security_group.azuredevopsnsg.id}"

  ip_configuration {
    name                          = "AzureDevOpsNicConfiguration_Win"
    subnet_id                     = "${azurerm_subnet.azuredevopssubnet_win.id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = "${azurerm_public_ip.azuredevopspublicip_win.id}"
  }

  tags {
    environment = "AzureDevOps"
  }
}

# Generate random text for a unique storage account name
resource "random_id" "randomId" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = "${azurerm_resource_group.azuredevops.name}"
  }

  byte_length = 8
}

# Create storage account for boot diagnostics
resource "azurerm_storage_account" "azuredevopsstorageaccount" {
  name                     = "diag${random_id.randomId.hex}"
  resource_group_name      = "${azurerm_resource_group.azuredevops.name}"
  location                 = "${var.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags {
    environment = "AzureDevOps"
  }
}

# Create virtual machine
resource "azurerm_virtual_machine" "azuredevopsvm_win" {
  name                  = "AzureDevOps"
  location              = "${var.location}"
  resource_group_name   = "${azurerm_resource_group.azuredevops.name}"
  network_interface_ids = ["${azurerm_network_interface.azuredevopsnic_win.id}"]
  vm_size               = "${var.size}"
  delete_os_disk_on_termination = "true"
  delete_data_disks_on_termination = "true"

  storage_os_disk {
    name              = "AzureDevOpsOsDiskWin"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
  }

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  os_profile {
    computer_name  = "${var.hostname}"
    admin_username = "${var.admin_username}"
    admin_password = "${var.admin_password}"
  }

  os_profile_windows_config {
    provision_vm_agent        = true
    enable_automatic_upgrades = true
  }

  boot_diagnostics {
    enabled     = "true"
    storage_uri = "${azurerm_storage_account.azuredevopsstorageaccount.primary_blob_endpoint}"
  }

  

  tags {
    environment = "AzureDevOps"
  }
}

# Custom script extension to install the DevOps agent
resource "azurerm_virtual_machine_extension" "azuredevopsvmex" {
  name                 = "AzureDevOpsAgent"
  location             = "${var.location}"
  resource_group_name  = "${azurerm_resource_group.azuredevops.name}"
  virtual_machine_name = "${azurerm_virtual_machine.azuredevopsvm_win.name}"
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"

  settings = <<SETTINGS
  {
  "fileUris": ["https://maxmelcherdevops.blob.core.windows.net/terraform/devops_win.ps1?sp=r&st=2019-03-13T11:13:24Z&se=2022-03-13T19:13:24Z&spr=https&sv=2018-03-28&sig=%2BlOz%2Fza3vlunvhARYgG5GLlrhzRADE1LrLUWu9cIlUc%3D&sr=b"],
  "commandToExecute": "powershell.exe -ExecutionPolicy Unrestricted -File ./devops_win.ps1 -URL ${var.url} -PAT ${var.pat} -POOL ${var.pool} -AGENT ${var.agent}",
  "timestamp" : "12"
  }
SETTINGS

  tags {
    environment = "Production"
  }
}
{{< /highlight >}}

This time I installed an B1MS VM - burstable VMs are perfect for build servers and they are cheap. The whole setup cost [around 22€/month for a 24/7 setup](https://azure.com/e/0fb474f05e174345b3bffc47cd11aa7e). Perfect for my use case!

{{% notice "warning" %}}
Again, there is no NSG rule to allow RDP connections. If you want to connect to the VM, then you have to create a allow rule first to accept the connection. Safety first.
{{% /notice %}}

## PowerShell Installation of Azure DevOps Agent

The 'magic' happens in the custom script extension. [With the PowerShell script](https://maxmelcherdevops.blob.core.windows.net/terraform/devops_win.ps1?sp=r&st=2019-03-13T11:13:24Z&se=2022-03-13T19:13:24Z&spr=https&sv=2018-03-28&sig=%2BlOz%2Fza3vlunvhARYgG5GLlrhzRADE1LrLUWu9cIlUc%3D&sr=b ) I download the latest Azure DevOps build agent and configure it. 
The configuration parameters are all set via the [terraform variable file](terraform.tfvars).

{{< highlight powershell >}}
param (
    [string]$URL,
    [string]$PAT,
    [string]$POOL,
    [string]$AGENT
)

Start-Transcript
Write-Host "start"

#test if an old installation exists, if so, delete the folder
if (test-path "c:\agent")
{
    Remove-Item -Path "c:\agent" -Force -Confirm:$false -Recurse
}

#create a new folder
new-item -ItemType Directory -Force -Path "c:\agent"
set-location "c:\agent"

$env:VSTS_AGENT_HTTPTRACE = $true

#github requires tls 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

#get the latest build agent version
$wr = Invoke-WebRequest https://api.github.com/repos/Microsoft/azure-pipelines-agent/releases/latest -UseBasicParsing
$tag = ($wr | ConvertFrom-Json)[0].tag_name
$tag = $tag.Substring(1)

write-host "$tag is the latest version"
#build the url
$download = "https://vstsagentpackage.azureedge.net/agent/$tag/vsts-agent-win-x64-$tag.zip"

#download the agent
Invoke-WebRequest $download -Out agent.zip

#expand the zip
Expand-Archive -Path agent.zip -DestinationPath $PWD

#run the config script of the build agent
.\config.cmd --unattended --url "$URL" --auth pat --token "$PAT" --pool "$POOL" --agent "$AGENT" --acceptTeeEula --runAsService

#exit
Stop-Transcript
exit 0
{{< /highlight >}}

## Video

See the script in action:
{{< youtube RhIBVgZVc9w >}}

## Summary

Same as for the Ubuntu server: With the terraform script above you get a naked Windows Server 2016 VM registered as Azure DevOps build/release agent in roughly 10 minutes for a few Euros per month. Once the agent is up and running you can (and must!) configure the agent to your needs. Don't forget to patch the agents - or destroy and recreate them regularly.

Hope it helps,  
Max