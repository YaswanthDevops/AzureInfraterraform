resource "azurerm_resource_group" "TerraformRG" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "Terraform-Vnet" {
  name                = var.virtual_network_name
  location            = azurerm_resource_group.TerraformRG.location
  resource_group_name = azurerm_resource_group.TerraformRG.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "mydefaultsubnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.TerraformRG.name
  virtual_network_name = azurerm_virtual_network.Terraform-Vnet.name
  address_prefixes     = ["10.0.0.0/24"]
}
# Create Storage Account
resource "azurerm_storage_account" "terraformsa" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.TerraformRG.name
  location                 = azurerm_resource_group.TerraformRG.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Create Storage Container for Terraform State
resource "azurerm_storage_container" "terraform_container" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.terraformsa.name
  container_access_type = "private"
}

resource "azurerm_virtual_machine" "my_vm" {
  name                  = var.virtual_machine_name
  location              = azurerm_resource_group.TerraformRG.location
  resource_group_name   = azurerm_resource_group.TerraformRG.name
  network_interface_ids = ["/subscriptions/b3c9519c-431e-4755-a70a-e44b4a68c99c/resourceGroups/my-terraform-rg/providers/Microsoft.Network/networkInterfaces/rhel8696"]
  vm_size               = "Standard_B1s"

   storage_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "8-lvm"
    version   = "latest"
  } 

  storage_os_disk {
    name              = "rhel8OsDisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
  }

  os_profile {
    computer_name  = "rhel8"
    admin_username = "yashuser"
    admin_password = "Yash@12345678"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  additional_capabilities {  # Add this to match existing state
  ultra_ssd_enabled = false
  }

  boot_diagnostics {          # Add this to match existing state
  enabled = false
  storage_uri  = azurerm_storage_account.terraformsa.primary_blob_endpoint
  }
}