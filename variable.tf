variable "prefix" {
  default = "tfvmex"
}

variable "resource_group_name" {
  description = "The name of the Azure resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "virtual_network_name" {
  description = "The name of Virtual Network"
  type        = string
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
}

variable "virtual_machine_name" {
  description = "Vm name"
  type        = string
}