terraform {
  required_version = ">= 1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "local" {
    path = "/Users/shubham/Downloads/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id         = "Your_subscription_id"
}

#### MODULES DEFINED HERE ###

## These will take the values from ../tf-modules .. DIRS

module "resource_group" {
  source                  = "../tf-modules/resource-group"
  resource_group_name     = var.resource_group_name
  location                = var.location
}

module "log_analytics" {
  source                  = "../tf-modules/log-analytics"
  resource_group_name     = module.resource_group.resource_group_name
  workspace_name          = var.workspace_name
  location                = var.location
}

module "container_app_environment" {
  source                  = "../tf-modules/container-app-environment"
  resource_group_name     = module.resource_group.resource_group_name
  location                = var.location
  log_analytics_workspace_id  = module.log_analytics.log_analytics_workspace_id
  container_app_env_name  = var.container_app_env_name
}

module "container_app" {
  source                        = "../tf-modules/container-app"
  resource_group_name           = module.resource_group.resource_group_name
  container_app_name            = var.container_app_name
  container_app_environment_id  = module.container_app_environment.container_app_environment_id
}
