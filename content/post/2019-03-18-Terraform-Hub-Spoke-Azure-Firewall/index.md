---
title: "Hub & Spoke with Azure Firewall"
date: 2019-03-27T10:05:16+01:00
2019: "03"
author: "Max Melcher"
draft: true
categories:
  - Azure
  - Terraform
tags:
  - Hub & Spoke
  - Terraform
  - Azure
featured: "images/azure-firewall-hybrid-network-hub-spoke.png"
featuredalt : ""
hashtags: 
  - "#azure"
  - "#terraform"
---

In this post I explain how to set up a Hub & Spoke architecture with Azure Firewall.
<!--more-->

As of now, there is a really great [tutorial how to configure a hub and spoke hybrid network topology with Terraform on Azure](https://docs.microsoft.com/en-us/azure/terraform/terraform-hub-spoke-introduction). If you are not familar with the hub and spoke architecture, I recommend you to read more about it in the [reference architecture](https://docs.microsoft.com/en-us/azure/architecture/reference-architectures/hybrid-networking/hub-spoke), it explains the pros and cons, considerations and provides a deployment package.

If you are more into Terraform and on the other hand want full control of the network traffic, read on.

## Azure Firewall

Azure Firewall is a rather new service - here is a great introduction from Ignite 2018:
{{< youtube FAjlOK1bZyc 2042 >}}

I really like that it abstracts the infrastructure and you dont have to take care of scaling, patching and logging. High availability out of the box. Great.

Given all that, lets focus on the provisioning part.

## Hub & Spoke, Terraform and Azure Firewall

Next up, we are going to provision the following architecture:

{{< fancybox "images" "azure-firewall-hybrid-network-hub-spoke.png" "Azure Firewall in a hub and spoke topology" "single_image" >}}

The architecture has the following components:

* **On-premises network**. A private local-area network running with an organization. For hub and spoke reference architecture, a VNet in Azure is used to simulate an on-premises network.

* **VPN device**. A VPN device or service provides external connectivity to the on-premises network. The VPN device may be a hardware appliance or a software solution.

* **Hub VNet**. The hub is the central point of connectivity to your on-premises network and a place to host services. These services can be consumed by the different workloads hosted in the spoke VNets. The hub contains the Azure Firewall for central traffic management.

* **Gateway subnet**. The VNet gateways are held in the same subnet.

* **Spoke VNets**. Spokes can be used to isolate workloads in their own VNets, managed separately from other spokes. Each workload might include multiple tiers, with multiple subnets connected through Azure load balancers.

* **VNet peering**. Two VNets can be connected using a peering connection. Peering connections are non-transitive, low latency connections between VNets. Once peered, the VNets exchange traffic by using the Azure backbone, without needing a router. In a hub and spoke network topology, VNet peering is used to connect the hub to each spoke. You can peer VNets in the same region, or different regions.

### Variables.tf

I use the following variables across the terraform scripts. Copy them to a file called [variables.tf](variables.tf) and put it in a directory:

{{< highlight bash >}}
variable "location" {
  description = "Location of the network"
  default     = "westeurope"
}

variable "username" {
  description = "Username for Virtual Machines"
  default     = ""
}

variable "password" {
  description = "Password for Virtual Machines"
  default     = ""
}

variable "vmsize" {
  description = "Size of the VMs"
  default     = "Standard_DS1_v2"
}

variable "sshkey" {
  description = "SSH key for Linux Virtual Machines"
  default     = ""
}
{{< /highlight >}}

### on-prem.tf

Next, we provision the simulated on-premises environment by adding [on-prem.tf](on-prem.tf) to the same directory. It provisions:

* a virtual network with a 192.168.0.0/16 range
* a linux vm with a public ip secured by network security group
* a virtual network gateway with a public ip

{{< highlight bash >}}
locals {
  onprem-resource-group = "onprem-vnet-rg"
  prefix-onprem         = "onprem"
}

data "http" "myip" {
  url = "https://api.ipify.org/"
}

resource "azurerm_resource_group" "onprem-vnet-rg" {
  name     = "${local.onprem-resource-group}"
  location = "${var.location}"

  tags {
    environment = "hub-spoke"
  }
}

resource "azurerm_virtual_network" "onprem-vnet" {
  name                = "onprem-vnet"
  location            = "${azurerm_resource_group.onprem-vnet-rg.location}"
  resource_group_name = "${azurerm_resource_group.onprem-vnet-rg.name}"
  address_space       = ["192.168.0.0/16"]

  tags {
    environment = "${local.prefix-onprem}"
  }
}

resource "azurerm_subnet" "onprem-gateway-subnet" {
  name                 = "GatewaySubnet"
  resource_group_name  = "${azurerm_resource_group.onprem-vnet-rg.name}"
  virtual_network_name = "${azurerm_virtual_network.onprem-vnet.name}"
  address_prefix       = "192.168.255.224/27"
}

resource "azurerm_subnet" "onprem-mgmt" {
  name                 = "mgmt"
  resource_group_name  = "${azurerm_resource_group.onprem-vnet-rg.name}"
  virtual_network_name = "${azurerm_virtual_network.onprem-vnet.name}"
  address_prefix       = "192.168.1.128/25"
}

resource "azurerm_public_ip" "onprem-pip" {
    name                         = "${local.prefix-onprem}-pip"
    location            = "${azurerm_resource_group.onprem-vnet-rg.location}"
    resource_group_name = "${azurerm_resource_group.onprem-vnet-rg.name}"
    allocation_method   = "Dynamic"

    tags {
        environment = "${local.prefix-onprem}"
    }
}

resource "azurerm_network_interface" "onprem-nic" {
  name                 = "${local.prefix-onprem}-nic"
  location             = "${azurerm_resource_group.onprem-vnet-rg.location}"
  resource_group_name  = "${azurerm_resource_group.onprem-vnet-rg.name}"
  enable_ip_forwarding = true

  ip_configuration {
    name                          = "${local.prefix-onprem}"
    subnet_id                     = "${azurerm_subnet.onprem-mgmt.id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${azurerm_public_ip.onprem-pip.id}"
  }
}

# Create Network Security Group and rule
# NSG to allow incoming connections only from your current IP
resource "azurerm_network_security_group" "onprem-nsg" {
    name                = "${local.prefix-onprem}-nsg"
    location            = "${azurerm_resource_group.onprem-vnet-rg.location}"
    resource_group_name = "${azurerm_resource_group.onprem-vnet-rg.name}"

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

    tags {
        environment = "onprem"
    }
}

resource "azurerm_subnet_network_security_group_association" "mgmt-nsg-association" {
  subnet_id                 = "${azurerm_subnet.onprem-mgmt.id}"
  network_security_group_id = "${azurerm_network_security_group.onprem-nsg.id}"
}

resource "azurerm_virtual_machine" "onprem-vm" {
  name                  = "${local.prefix-onprem}-vm"
  location              = "${azurerm_resource_group.onprem-vnet-rg.location}"
  resource_group_name   = "${azurerm_resource_group.onprem-vnet-rg.name}"
  network_interface_ids = ["${azurerm_network_interface.onprem-nic.id}"]
  vm_size               = "${var.vmsize}"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "${local.prefix-onprem}-vm"
    admin_username = "${var.username}"
    admin_password = "${var.password}"
  }

  os_profile_linux_config {

    disable_password_authentication = false
    ssh_keys {
            path     = "/home/${var.username}/.ssh/authorized_keys"
            key_data = "${var.sshkey}"
        }
  }

  tags {
    environment = "${local.prefix-onprem}"
  }
}

resource "azurerm_public_ip" "onprem-vpn-gateway1-pip" {
  name                = "${local.prefix-onprem}-vpn-gateway1-pip"
  location            = "${azurerm_resource_group.onprem-vnet-rg.location}"
  resource_group_name = "${azurerm_resource_group.onprem-vnet-rg.name}"

  allocation_method = "Dynamic"
}

resource "azurerm_virtual_network_gateway" "onprem-vpn-gateway" {
  name                = "onprem-vpn-gateway1"
  location            = "${azurerm_resource_group.onprem-vnet-rg.location}"
  resource_group_name = "${azurerm_resource_group.onprem-vnet-rg.name}"

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = "VpnGw1"

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = "${azurerm_public_ip.onprem-vpn-gateway1-pip.id}"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = "${azurerm_subnet.onprem-gateway-subnet.id}"
  }
  depends_on = ["azurerm_public_ip.onprem-vpn-gateway1-pip"]
}
{{< /highlight >}}

So far, a **terraform apply** will provision 11 resources and takes approximately 20 minutes.

{{< fancybox "images" "TF-OnPrem.png" "11 resources for simulated on-Prem environment" "single_image" >}}

### Create the hub vnet

Then we will create the hub with the following components:

* a VNET with 10.0.0.0 /16 range.
* a 10.0.255.224 /27 subnet for the second gateway
* a 10.0.0.64 /27 subnet for a hub VM
* a linux vm with a private ip
* the second VPN gateway and the connection to the onPrem gateway.

Store the script in a file called [hub-vnet.tf](hub-vnet.tf):

{{< highlight bash >}}
locals {
  prefix-hub         = "hub"
  hub-resource-group = "hub-vnet-rg"
  shared-key         = "4-v3ry-53cr37-1p53c-5h4r3d-k3y"
}

resource "azurerm_resource_group" "hub-vnet-rg" {
  name     = "${local.hub-resource-group}"
  location = "${var.location}"

  tags {
    environment = "HubSpoke"
  }
}

resource "azurerm_virtual_network" "hub-vnet" {
  name                = "${local.prefix-hub}-vnet"
  location            = "${azurerm_resource_group.hub-vnet-rg.location}"
  resource_group_name = "${azurerm_resource_group.hub-vnet-rg.name}"
  address_space       = ["10.0.0.0/16"]

  tags {
    environment = "hub-spoke"
  }
}

resource "azurerm_subnet" "hub-gateway-subnet" {
  name                 = "GatewaySubnet"
  resource_group_name  = "${azurerm_resource_group.hub-vnet-rg.name}"
  virtual_network_name = "${azurerm_virtual_network.hub-vnet.name}"
  address_prefix       = "10.0.255.224/27"
}

resource "azurerm_subnet" "hub-mgmt" {
  name                 = "${local.prefix-hub}-mgmt"
  resource_group_name  = "${azurerm_resource_group.hub-vnet-rg.name}"
  virtual_network_name = "${azurerm_virtual_network.hub-vnet.name}"
  address_prefix       = "10.0.0.64/27"
}

resource "azurerm_network_interface" "hub-nic" {
  name                 = "${local.prefix-hub}-nic"
  location             = "${azurerm_resource_group.hub-vnet-rg.location}"
  resource_group_name  = "${azurerm_resource_group.hub-vnet-rg.name}"
  enable_ip_forwarding = true

  ip_configuration {
    name                          = "${local.prefix-hub}"
    subnet_id                     = "${azurerm_subnet.hub-mgmt.id}"
    private_ip_address_allocation = "Dynamic"
  }

  tags {
    environment = "${local.prefix-hub}"
  }
}

#Virtual Machine
resource "azurerm_virtual_machine" "hub-vm" {
  name                  = "${local.prefix-hub}-vm"
  location              = "${azurerm_resource_group.hub-vnet-rg.location}"
  resource_group_name   = "${azurerm_resource_group.hub-vnet-rg.name}"
  network_interface_ids = ["${azurerm_network_interface.hub-nic.id}"]
  vm_size               = "${var.vmsize}"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "${local.prefix-hub}-vm"
    admin_username = "${var.username}"
    admin_password = "${var.password}"
  }

  os_profile_linux_config {
    disable_password_authentication = false

    ssh_keys {
      path     = "/home/${var.username}/.ssh/authorized_keys"
      key_data = "${var.sshkey}"
    }
  }

  tags {
    environment = "${local.prefix-hub}"
  }
}

# Virtual Network Gateway
resource "azurerm_public_ip" "hub-vpn-gateway1-pip" {
  name                = "hub-vpn-gateway1-pip"
  location            = "${azurerm_resource_group.hub-vnet-rg.location}"
  resource_group_name = "${azurerm_resource_group.hub-vnet-rg.name}"

  allocation_method = "Dynamic"
}

resource "azurerm_virtual_network_gateway" "hub-vnet-gateway" {
  name                = "hub-vpn-gateway1"
  location            = "${azurerm_resource_group.hub-vnet-rg.location}"
  resource_group_name = "${azurerm_resource_group.hub-vnet-rg.name}"

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = "VpnGw1"

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = "${azurerm_public_ip.hub-vpn-gateway1-pip.id}"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = "${azurerm_subnet.hub-gateway-subnet.id}"
  }

  depends_on = ["azurerm_public_ip.hub-vpn-gateway1-pip"]
}

resource "azurerm_virtual_network_gateway_connection" "hub-onprem-conn" {
  name                = "hub-onprem-conn"
  location            = "${azurerm_resource_group.hub-vnet-rg.location}"
  resource_group_name = "${azurerm_resource_group.hub-vnet-rg.name}"

  type           = "Vnet2Vnet"
  routing_weight = 1

  virtual_network_gateway_id      = "${azurerm_virtual_network_gateway.hub-vnet-gateway.id}"
  peer_virtual_network_gateway_id = "${azurerm_virtual_network_gateway.onprem-vpn-gateway.id}"

  shared_key = "${local.shared-key}"
}

resource "azurerm_virtual_network_gateway_connection" "onprem-hub-conn" {
  name                            = "onprem-hub-conn"
  location                        = "${azurerm_resource_group.onprem-vnet-rg.location}"
  resource_group_name             = "${azurerm_resource_group.onprem-vnet-rg.name}"
  type                            = "Vnet2Vnet"
  routing_weight                  = 1
  virtual_network_gateway_id      = "${azurerm_virtual_network_gateway.onprem-vpn-gateway.id}"
  peer_virtual_network_gateway_id = "${azurerm_virtual_network_gateway.hub-vnet-gateway.id}"

  shared_key = "${local.shared-key}"
}
{{< /highlight >}}

This will provision another 10 resources.

### Azure Firewall

Now we will create the Azure Firewall in the hub. I use the script [hub-azurefw.tf](hub-azurefw.tf) to provision:

* a public ip for the Azure Firewall
* the Azure Firewall
* Azure Firewall rules for DNS and ping

{{< highlight bash >}}
locals {
  prefix-hub-fw         = "hub-fw"
  hub-fw-resource-group = "hub-fw-rg"
}

resource "azurerm_subnet" "hub-fw-subnet" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = "${azurerm_resource_group.hub-vnet-rg.name}"
  virtual_network_name = "${azurerm_virtual_network.hub-vnet.name}"
  address_prefix       = "10.0.1.0/24"
}

resource "azurerm_public_ip" "hub-fw-pip" {
  name                = "${local.prefix-hub-fw}pip"
  location            = "${azurerm_resource_group.hub-vnet-rg.location}"
  resource_group_name = "${azurerm_resource_group.hub-vnet-rg.name}"
  allocation_method   = "Static"
  sku                 = "Standard"
}


#https://www.terraform.io/docs/providers/azurerm/r/firewall.html
resource "azurerm_firewall" "hub-fw" {
  name                = "hub-fw"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.hub-vnet-rg.name}"
  
  ip_configuration {
    name                 = "hub-fw-ip"
    subnet_id            = "${azurerm_subnet.hub-fw-subnet.id}"
    public_ip_address_id = "${azurerm_public_ip.hub-fw-pip.id}"
    
  }
}

resource "azurerm_firewall_network_rule_collection" "hub-fw-rule" {
  name                = "hub-fw-rule"
  resource_group_name = "${azurerm_resource_group.hub-vnet-rg.name}"
  action              = "Allow"
  priority            = 100
  azure_firewall_name = "${azurerm_firewall.hub-fw.name}"

  rule {
    name = "outbound_dns"

    #allow dns resolve from any source
    source_addresses = ["${azurerm_virtual_network.hub-vnet.address_space}",]

    destination_ports = ["53"]

    #allow cloudflare dns
    destination_addresses = ["1.1.1.1",]

    protocols = ["TCP", "UDP"]
  }

  rule {
    name = "ping"

    #allow pings from any source
    source_addresses = ["*",]

    destination_ports = ["*"]

    #any source
    destination_addresses = ["*",]

    #ping protocol
    protocols = ["ICMP"]
  }
}
{{< /highlight >}}

That took 8 minutes for me.

### Spokes

Finally, we provision two spokes: [spoke1.tf] [spoke2.tf]

It provisions for spoke 1:

* a virtual network with range: 10.1.0.0 /16
* a management subnet in the range 10.1.0.64 /27
* a peering of the spoke vnet to the hub vnet
* a peering of the hub vnet to the spoke vnet
* a linux vm in the management subnet with only a private ip

and similar for spoke 2:

* a virtual network with range: 10.2.0.0 /16
* a management subnet in the range 10.2.0.64 /27
* a peering of the spoke vnet to the hub vnet
* a peering of the hub vnet to the spoke vnet
* a linux vm in the management subnet with only a private ip

Creating more spokes is simple: Replace all occurrences of the spoke name and adjust the IP ranges.

And here the code for spoke1:

{{< highlight bash >}}
locals {
  spoke1-resource-group = "spoke1-vnet-rg"
  prefix-spoke1         = "spoke1"
}

resource "azurerm_resource_group" "spoke1-vnet-rg" {
  name     = "${local.spoke1-resource-group}"
  location = "${var.location}"

  tags {
    environment = "HubSpoke"
  }
}

resource "azurerm_virtual_network" "spoke1-vnet" {
  name                = "spoke1-vnet"
  location            = "${azurerm_resource_group.spoke1-vnet-rg.location}"
  resource_group_name = "${azurerm_resource_group.spoke1-vnet-rg.name}"
  address_space       = ["10.1.0.0/16"]

  tags {
    environment = "${local.prefix-spoke1 }"
  }
}

resource "azurerm_subnet" "spoke1-mgmt" {
  name                 = "${local.prefix-spoke1}-mgmt"
  resource_group_name  = "${azurerm_resource_group.spoke1-vnet-rg.name}"
  virtual_network_name = "${azurerm_virtual_network.spoke1-vnet.name}"
  address_prefix       = "10.1.0.64/27"
}

resource "azurerm_subnet" "spoke1-workload" {
  name                 = "workload"
  resource_group_name  = "${azurerm_resource_group.spoke1-vnet-rg.name}"
  virtual_network_name = "${azurerm_virtual_network.spoke1-vnet.name}"
  address_prefix       = "10.1.1.0/24"
}

resource "azurerm_virtual_network_peering" "spoke1-hub-peer" {
  name                      = "spoke1-hub-peer"
  resource_group_name       = "${azurerm_resource_group.spoke1-vnet-rg.name}"
  virtual_network_name      = "${azurerm_virtual_network.spoke1-vnet.name}"
  remote_virtual_network_id = "${azurerm_virtual_network.hub-vnet.id}"

  allow_virtual_network_access = true
  allow_forwarded_traffic = true
  allow_gateway_transit   = false
  use_remote_gateways     = true
  depends_on = ["azurerm_virtual_network.spoke1-vnet", "azurerm_virtual_network.hub-vnet" , "azurerm_virtual_network_gateway.hub-vnet-gateway"]
}

resource "azurerm_network_interface" "spoke1-nic" {
  name                 = "${local.prefix-spoke1}-nic"
  location             = "${azurerm_resource_group.spoke1-vnet-rg.location}"
  resource_group_name  = "${azurerm_resource_group.spoke1-vnet-rg.name}"
  enable_ip_forwarding = true

  ip_configuration {
    name                          = "${local.prefix-spoke1}"
    subnet_id                     = "${azurerm_subnet.spoke1-mgmt.id}"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "spoke1-vm" {
  name                  = "${local.prefix-spoke1}-vm"
  location              = "${azurerm_resource_group.spoke1-vnet-rg.location}"
  resource_group_name   = "${azurerm_resource_group.spoke1-vnet-rg.name}"
  network_interface_ids = ["${azurerm_network_interface.spoke1-nic.id}"]
  vm_size               = "${var.vmsize}"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "${local.prefix-spoke1}-vm"
    admin_username = "${var.username}"
    admin_password = "${var.password}"
  }

  os_profile_linux_config {

    disable_password_authentication = false
    ssh_keys {
            path     = "/home/${var.username}/.ssh/authorized_keys"
            key_data = "${var.sshkey}"
        }
  }

  tags {
    environment = "${local.prefix-spoke1}"
  }
}
resource "azurerm_virtual_network_peering" "hub-spoke1-peer" {
  name                      = "hub-spoke1-peer"
  resource_group_name       = "${azurerm_resource_group.hub-vnet-rg.name}"
  virtual_network_name      = "${azurerm_virtual_network.hub-vnet.name}"
  remote_virtual_network_id = "${azurerm_virtual_network.spoke1-vnet.id}"
  allow_virtual_network_access = true
  allow_forwarded_traffic   = true
  allow_gateway_transit     = true
  use_remote_gateways       = false
  depends_on = ["azurerm_virtual_network.spoke1-vnet", "azurerm_virtual_network.hub-vnet", "azurerm_virtual_network_gateway.hub-vnet-gateway"]
}
{{< /highlight >}}

### Routes

Lastly, we have to configure the routing so that all the spoke traffic is routed to the hub. [routes.tf]

{{< highlight bash >}}
# Routes for the hub
#   Route to Spoke1 to the FW
#   Route to Spoke2 to the FW
#   Everthing else route within the vnet
resource "azurerm_route_table" "hub-gateway-rt" {
  name                          = "hub-gateway-rt"
  location                      = "${azurerm_resource_group.hub-vnet-rg.location}"
  resource_group_name           = "${azurerm_resource_group.hub-vnet-rg.name}"
  disable_bgp_route_propagation = false

  route {
    name           = "toHub"
    address_prefix = "10.0.0.0/16"
    next_hop_type  = "VnetLocal"
  }

  route {
    name                   = "toSpoke1"
    address_prefix         = "10.1.0.0/16"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "${azurerm_firewall.hub-fw.ip_configuration.0.private_ip_address}"
  }

  route {
    name                   = "toSpoke2"
    address_prefix         = "10.2.0.0/16"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "${azurerm_firewall.hub-fw.ip_configuration.0.private_ip_address}"
  }

  tags {
    environment = "${local.prefix-hub}"
  }
}

# Associate hub vnet gateway subnet with hub gateway route table
resource "azurerm_subnet_route_table_association" "hub-gateway-rt-hub-vnet-gateway-subnet" {
  subnet_id      = "${azurerm_subnet.hub-gateway-subnet.id}"
  route_table_id = "${azurerm_route_table.hub-gateway-rt.id}"
  depends_on = ["azurerm_subnet.hub-gateway-subnet"]
}

# Routes for the spoke1
#   Everthing within the vnet
resource "azurerm_route_table" "spoke1-rt" {
  name                          = "spoke1-rt"
  location                      = "${azurerm_resource_group.spoke1-vnet-rg.location}"
  resource_group_name           = "${azurerm_resource_group.spoke1-vnet-rg.name}"
  disable_bgp_route_propagation = false

  route {
    name           = "default"
    address_prefix = "0.0.0.0/0"
    next_hop_type  = "vnetlocal"
  }

  tags {
    environment = "${local.prefix-spoke1}"
  }
}

# Associate spoke1 vnet mgmt subnet with spoke1 route table
resource "azurerm_subnet_route_table_association" "spoke1-rt-spoke1-vnet-mgmt" {
  subnet_id      = "${azurerm_subnet.spoke1-mgmt.id}"
  route_table_id = "${azurerm_route_table.spoke1-rt.id}"
  depends_on = ["azurerm_subnet.spoke1-mgmt"]
}

# Associate spoke1 vnet workload subnet with spoke1 route table
resource "azurerm_subnet_route_table_association" "spoke1-rt-spoke1-vnet-workload" {
  subnet_id      = "${azurerm_subnet.spoke1-workload.id}"
  route_table_id = "${azurerm_route_table.spoke1-rt.id}"
  depends_on = ["azurerm_subnet.spoke1-workload"]
}
{{< /highlight >}}

//TODO: Routes for Spoke 2

### Testing 

So next up, we are going to test the connectivity and of course the filtering capabilities. Therefore, we connect to the onPrem-vm. It is the only VM with a public IP and simulates our onPrem environment:

{{< fancybox "images" "ConnectOnPrem.png" "Connecting to our onPrem " "single_image" >}}

I used the same SSH key in all VMs, so connecting to them via SSH is easy:
{{< fancybox "images" "VMs.png" "Connecting to VMs" "single_image" >}}

I am able to ping all VMs from onPrem - the VM in the hub (10.0.0.68), the VM in spoke1 (10.1.0.68) and the VM in spoke2 (10.2.0.68):
{{< fancybox "images" "onPremPing.png" "Pinging all VMs from onPrem" "single_image" >}}

Now I ssh to the onPrem vm and from there to spoke1. 
In my case that is:
> ssh mamelch@52.232.22.45
and from there
> ssh mamelch@10.1.0.68

Works, great!

Now from I try to get a connection from spoke1 to spoke2 to test the indirect, now transitive peering:
> ssh mamelch@10.2.0.68


## Video

<video autoplay loop muted playsinline>
	 <source src="images/HubSpoke.mp4" type="video/mp4">
	 <source src="images/HubSpoke.webm" type="video/webm">
	     Your browser does not support the video tags, so no video for you today.
</video>
