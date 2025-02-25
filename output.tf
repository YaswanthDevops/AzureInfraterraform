output "resource_group_name" {
  description = "The name of the created resource group"
  value       = azurerm_resource_group.TerraformRG.name
}

output "virtual_network_name" {
  description = "The name of the created virtual network"
  value       = azurerm_virtual_network.azurevnet.name
}

output "azurerm_subnet_name" {
  description = "Subnet name"
  value       = azurerm_subnet.azsubnet.name
}

output "azurerm_network_interface" {
  description = "nic details"
  value = azurerm_network_interface.azurenic.id
}

output "azurerm_virtual_machine_name" {
  description = "vm name"
  value       = azurerm_virtual_machine.my_vm.name
}



