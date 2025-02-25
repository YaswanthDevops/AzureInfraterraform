output "resource_group_name" {
  description = "The name of the created resource group"
  value       = azurerm_resource_group.TerraformRG.name
}

output "virtual_network_name" {
  description = "The name of the created virtual network"
  value       = azurerm_virtual_network.Terraform-Vnet.name
}

output "storage_account_name" {
  description = " Storage account name "
  value       = azurerm_storage_account.terraformsa.name
}

output "container_name" {
  description = "container name"
  value       = azurerm_storage_container.terraform_container.name
}

output "azurerm_subnet_name" {
  description = "Subnet name"
  value       = azurerm_subnet.mydefaultsubnet.name
}

output "azurerm_virtual_machine_name" {
  description = "vm name"
  value       = azurerm_virtual_machine.my_vm.name
}



