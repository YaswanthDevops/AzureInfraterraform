variable "prefix" {
  type    = string
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