terraform {
  backend "azurerm" {
    resource_group_name  = "my-terraform-rg"
    storage_account_name = "yashstorage9876456"
    container_name       = "yashbackendcontainer7654"
    key                  = "terraform.tfstate"
  }
}
