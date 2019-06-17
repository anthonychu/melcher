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

    #allow any source
    destination_addresses = ["*",]

    #ping protocol
    protocols = ["ICMP"]
  }

    rule {
    name = "ssh"
     
    #allow ssh from any source
    source_addresses = ["*"]

    #ssh default port
    destination_ports = ["22"]

    #allow any source
    destination_addresses = ["*",]

    #any protocol
    protocols = ["Any"]
  }
}

