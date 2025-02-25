terraform {
  backend "azurerm" {
    resource_group_name  = "NetworkWatcherRG"
    storage_account_name = "yashstorage98764567"
    container_name       = "yashbackendcontainer7654"
    key                  = "terraform.tfstate"
  }
}
