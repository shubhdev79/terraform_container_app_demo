locals {
  location    = var.az_region
  resource_group_name = "container_app-${var.env}-${var.az_region}-1"
}


resource "azurerm_resource_group" "rg-container_app" {
  name     = local.resource_group_name
  location = local.location
  lifecycle {
     ignore_changes = [tags]   # We can revert this based on requirement
  }
}

resource "azurerm_log_analytics_workspace" "demo" {
  name                = "demo-workspace-${var.env}-${var.az_region}-1"
  location            = azurerm_resource_group.rg-container_app.location
  resource_group_name = azurerm_resource_group.rg-container_app.name
 #sku                 = "PerGB2018"
  retention_in_days   = 30
}


resource "azurerm_container_app_environment" "demo_container_app" {
  name                = "demo-container-app-${var.env}-${var.az_region}-1"
  location            = azurerm_resource_group.rg-container_app.location
  resource_group_name = azurerm_resource_group.rg-container_app.name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.demo.id
}

resource "azurerm_container_app" "demo_app" {
  name                         = "blend-containerapp-${var.env}-${var.az_region}-1"
  resource_group_name          = azurerm_resource_group.rg-container_app.name
  container_app_environment_id = azurerm_container_app_environment.demo_container_app.id
  revision_mode                = "Single"

  ingress {
    traffic_weight {
      percentage = 100
      latest_revision = true
      }
    external_enabled = true
    target_port     = 80  # It can be variablize in main.tf
    transport       = "auto"
  }

  template {
    container {
      name   = "nginx"
      image  = "nginx:latest"
      cpu    = 0.25      #It can be variablize in main.tf
      memory = "0.5Gi"   #It can be variablize in main.tf
    }
  }
}
