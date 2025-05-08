terraform {
  required_version = ">= 1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

# To use in actual deployments to store tfstates in Storage accounts
#  backend "azurerm" {
#     resource_group_name   =
#     storage_account_name  =
#     container_name        =
#     key                   =
#  }

  backend "local" {
    path = "/path_to.../terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id         = "Your_account_subscription_id"
}

locals {
 env = "dev" # Like this we can have different folders and have different envs
}

module "main" {

az_region                 = "uksouth"
env                       = local.env
app_required              = true
source                    = "../../tf-main"

}
