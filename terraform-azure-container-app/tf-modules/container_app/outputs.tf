
output "container_app_url" {
  description = "The public URL of the Container App"
  value       = azurerm_container_app.demo_app.latest_revision_fqdn
}
