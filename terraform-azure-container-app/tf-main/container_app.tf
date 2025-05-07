module "container_app" {
  count                        = var.app_required ? 1:0
  source                       = "../tf-modules/container_app"
  env                          = var.env
  az_region                    = var.az_region
}
