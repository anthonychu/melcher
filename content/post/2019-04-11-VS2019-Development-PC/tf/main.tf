#Specify Resource Group
variable "resourcegroup" {
  type    = "string"
  description = "Specify the resource group where the VM should be created"
}

#Location of the VM
variable "location" {
  type    = "string"
  description = "Specify the location where the resources should be created, e.g. westeurope"
}

#Replace [Organization] https://dev.azure.com/[Organization]/_usersSettings/tokens
variable "url" {
  type = "string"
  description = "Specify the Azure vs2019 url e.g. https://dev.azure.com/mmelcher"
}

variable "size" {
  type    = "string"
  description = "Specify the size of the VM"
}

#Hostname of the VM
variable "hostname" {
  type    = "string"
  description = "Specify the hostname of the VM"
}

#Admin username
variable "admin_username" {
  type    = "string"
  description = "Specify the admin username of the VM"
}

variable "admin_password" {
  type    = "string"
  description = "Specify the admin username of the VM"
}

# Create a resource group if it doesn’t exist
resource "azurerm_resource_group" "azurevs2019" {
  name     = "${var.resourcegroup}"
  location = "${var.location}"

  tags {
    environment = "VS2019"
  }
}

# Create virtual network
resource "azurerm_virtual_network" "azurevs2019network_win" {
  name                = "VS2019Vnet_Win"
  address_space       = ["10.19.0.0/16"]
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.azurevs2019.name}"

  tags {
    environment = "VS2019"
  }
}

# Create subnet
resource "azurerm_subnet" "azurevs2019subnet_win" {
  name                 = "Azurevs2019Subnet_Win"
  resource_group_name  = "${azurerm_resource_group.azurevs2019.name}"
  virtual_network_name = "${azurerm_virtual_network.azurevs2019network_win.name}"
  address_prefix       = "10.200.2.0/24"
}

# Create public IPs
resource "azurerm_public_ip" "azurevs2019publicip_win" {
  name                = "VS2019PublicIP_Win"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.azurevs2019.name}"
  allocation_method   = "Dynamic"

  tags {
    environment = "VS2019"
  }
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "azurevs2019nsg" {
  name                = "VS2019NetworkSecurityGroup"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.azurevs2019.name}"

  tags {
    environment = "VS2019"
  }
}

# Create network interface
resource "azurerm_network_interface" "azurevs2019nic_win" {
  name                      = "VS2019NIC_win"
  location                  = "${var.location}"
  resource_group_name       = "${azurerm_resource_group.azurevs2019.name}"
  network_security_group_id = "${azurerm_network_security_group.azurevs2019nsg.id}"

  ip_configuration {
    name                          = "VS2019NicConfiguration_Win"
    subnet_id                     = "${azurerm_subnet.azurevs2019subnet_win.id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = "${azurerm_public_ip.azurevs2019publicip_win.id}"
  }

  tags {
    environment = "VS2019"
  }
}

# Generate random text for a unique storage account name
resource "random_id" "randomId" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = "${azurerm_resource_group.azurevs2019.name}"
  }

  byte_length = 8
}

# Create storage account for boot diagnostics
resource "azurerm_storage_account" "azurevs2019storageaccount" {
  name                     = "diag${random_id.randomId.hex}"
  resource_group_name      = "${azurerm_resource_group.azurevs2019.name}"
  location                 = "${var.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags {
    environment = "VS2019"
  }
}

# Create virtual machine
resource "azurerm_virtual_machine" "azurevs2019vm_win" {
  name                  = "VS2019"
  location              = "${var.location}"
  resource_group_name   = "${azurerm_resource_group.azurevs2019.name}"
  network_interface_ids = ["${azurerm_network_interface.azurevs2019nic_win.id}"]
  vm_size               = "${var.size}"
  delete_os_disk_on_termination = "true"
  delete_data_disks_on_termination = "true"

  storage_os_disk {
    name              = "VS2019OsDiskWin"
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
    storage_uri = "${azurerm_storage_account.azurevs2019storageaccount.primary_blob_endpoint}"
  }

  

  tags {
    environment = "VS2019"
  }
}
