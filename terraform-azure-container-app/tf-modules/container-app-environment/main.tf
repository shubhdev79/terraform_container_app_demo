resource "azurerm_container_app_environment" "demo_container_app" {
  name                = var.container_app_env_name
  location            = var.location
  resource_group_name = var.resource_group_name
  log_analytics_workspace_id = var.log_analytics_workspace_id
}

output "container_app_environment_id" {
  value = azurerm_container_app_environment.demo_container_app.id
}
