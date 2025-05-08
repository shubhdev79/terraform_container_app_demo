
#This module will talk to the tf-modules and get the values

# Using this variable => app_required ( True/False ) in case we multiple regions and envs and we dont want the container app in one of it.

module "container_app" {
  count                        = var.app_required ? 1:0
  source                       = "../tf-modules/container_app"
  env                          = var.env
  az_region                    = var.az_region
}
