resource "azurerm_resource_group" "TerraformRG" {
  name     = "${var.prefix}-resources"
  location = var.location
}

resource "azurerm_virtual_network" "azurevnet" {
  name                = "${var.prefix}-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.TerraformRG.location
  resource_group_name = azurerm_resource_group.TerraformRG.name
}

resource "azurerm_subnet" "azsubnet" {
  name                 = "${var.prefix}-subnet"
  resource_group_name  = azurerm_resource_group.TerraformRG.name
  virtual_network_name = azurerm_virtual_network.azurevnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "azurenic" {
  name                = "${var.prefix}-nic"
  location            = azurerm_resource_group.TerraformRG.location
  resource_group_name = azurerm_resource_group.TerraformRG.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.azsubnet.id
    private_ip_address_allocation = "Static"
  }
}

resource "azurerm_virtual_machine" "myvm" {
  name                  = "${var.prefix}-linuxvm"
  location              = azurerm_resource_group.TerraformRG.location
  resource_group_name   = azurerm_resource_group.TerraformRG.name
  network_interface_ids = [azurerm_network_interface.azurenic.id]
  vm_size               = "Standard_DS1_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "ubuntuVM"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}