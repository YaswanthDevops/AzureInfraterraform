terraform {
  backend "azurerm" {
    resource_group_name  = "NetworkWatcherRG"
    storage_account_name = "yashstorage987654321"
    container_name       = "yashbackendcontainer7654"
    key                  = "terraform.tfstate"
  }
}
