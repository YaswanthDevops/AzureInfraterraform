variable "resource_group_name" {
  description = "The name of the Azure resource group"
  type        = string
  default     = "example-rg"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "virtual_network_name" {
  description = "The name of Virtual Network"
  type        = string
}

variable "storage_account_name" {
  description = "The name of Storage account"
  type        = string
  default     = "Backendstorage"
}

variable "storage_container_name" {
  description = "Container name"
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