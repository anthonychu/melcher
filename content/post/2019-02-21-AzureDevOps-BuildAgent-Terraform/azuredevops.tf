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

#SSH KEY - change it or you cant sign in to the VM!
variable "sshkey" {
  type    = "string"
  description = "Provide a ssh public key to logon to the VM"
}

variable "size" {
  type    = "string"
  description = "Specify the size of the VM"
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
resource "azurerm_virtual_network" "azuredevopsnetwork" {
  name                = "AzureDevOpsVnet"
  address_space       = ["10.100.0.0/16"]
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.azuredevops.name}"

  tags {
    environment = "AzureDevOps"
  }
}

# Create subnet
resource "azurerm_subnet" "azuredevopssubnet" {
  name                 = "AzureDevopsSubnet"
  resource_group_name  = "${azurerm_resource_group.azuredevops.name}"
  virtual_network_name = "${azurerm_virtual_network.azuredevopsnetwork.name}"
  address_prefix       = "10.100.1.0/24"
}

# Create public IPs
resource "azurerm_public_ip" "azuredevopspublicip" {
  name                = "AzureDevOpsPublicIP"
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
resource "azurerm_network_interface" "azuredevopsnic" {
  name                      = "AzureDevOpsNIC"
  location                  = "${var.location}"
  resource_group_name       = "${azurerm_resource_group.azuredevops.name}"
  network_security_group_id = "${azurerm_network_security_group.azuredevopsnsg.id}"

  ip_configuration {
    name                          = "AzureDevOpsNicConfiguration"
    subnet_id                     = "${azurerm_subnet.azuredevopssubnet.id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = "${azurerm_public_ip.azuredevopspublicip.id}"
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
resource "azurerm_virtual_machine" "azuredevopsvm" {
  name                  = "AzureDevOps"
  location              = "${var.location}"
  resource_group_name   = "${azurerm_resource_group.azuredevops.name}"
  network_interface_ids = ["${azurerm_network_interface.azuredevopsnic.id}"]
  vm_size               = "${var.size}"

  storage_os_disk {
    name              = "AzureDevOpsOsDisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04.0-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = "AzureDevOps"
    admin_username = "azuredevopsuser"
  }

  os_profile_linux_config {
    disable_password_authentication = true

    ssh_keys {
      path     = "/home/azuredevopsuser/.ssh/authorized_keys"
      key_data = "${var.sshkey}"
    }
  }

  boot_diagnostics {
    enabled     = "true"
    storage_uri = "${azurerm_storage_account.azuredevopsstorageaccount.primary_blob_endpoint}"
  }

  tags {
    environment = "AzureDevOps"
  }
}

resource "azurerm_virtual_machine_extension" "azuredevopsvmex" {
  name                 = "hostname"
  location             = "${var.location}"
  resource_group_name  = "${azurerm_resource_group.azuredevops.name}"
  virtual_machine_name = "${azurerm_virtual_machine.azuredevopsvm.name}"
  publisher            = "Microsoft.OSTCExtensions"
  type                 = "CustomScriptForLinux"
  type_handler_version = "1.2"

  settings = <<SETTINGS
  {
  "fileUris": ["https://gist.githubusercontent.com/MaxMelcher/bfe95eb55b33fa7b9bdbf68c9ac51811/raw/b42e685c6728e043d041e16c330c535a52bcf2ea/devops.shf"],
  "commandToExecute": "bash devops.sh '${var.url}' '${var.pat}' '${var.pool}' '${var.agent}'",
  "timestamp" : "11"
  }
SETTINGS

  tags {
    environment = "Production"
  }
}