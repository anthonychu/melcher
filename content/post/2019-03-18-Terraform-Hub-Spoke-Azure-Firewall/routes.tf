# Routes for the hub
#   Route to Spoke1
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
  disable_bgp_route_propagation = true

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