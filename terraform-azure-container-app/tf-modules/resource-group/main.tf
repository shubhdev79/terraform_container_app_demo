resource "azurerm_resource_group" "rg-container_app-rg" {
  name     = var.resource_group_name
  location = var.location
  lifecycle {
     ignore_changes = [tags]   # We can revert this based on the requirement
  }
}

output "resource_group_name" {
  value = azurerm_resource_group.rg-container_app-rg.name
}
