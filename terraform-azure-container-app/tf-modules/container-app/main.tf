resource "azurerm_container_app" "container_app" {
  name                         = var.container_app_name
  resource_group_name          = var.resource_group_name
  container_app_environment_id = var.container_app_environment_id
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

# This will be used in tf-main/main.tf
 output "container_app_fqdn" {
   value = azurerm_container_app.container_app.latest_revision_fqdn
 }
