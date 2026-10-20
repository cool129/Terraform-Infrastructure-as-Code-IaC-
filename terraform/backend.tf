
terraform {
  backend "azurerm" {
    resource_group_name  = "gimbus-rg"
    storage_account_name = "gimbussae3lsu"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
