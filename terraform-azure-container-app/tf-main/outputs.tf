output "container_app_url" {
  description = "The public URL/FQDN of the Container App"
  value       = module.container_app.container_app_fqdn
}
