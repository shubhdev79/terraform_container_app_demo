variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "container_app-dev-uksouth-1"
}

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
  default     = "UK South"
}

variable "workspace_name" {
  description = "The name of the Log Analytics workspace"
  type        = string
  default     = "demo-workspace-dev-uksouth-1"
}

variable "container_image" {
  description = "The public container image to deploy"
  type        = string
  default     = "nginx"
}

variable "container_app_env_name" {
  description = "The container app env name"
  type        = string
  default     = "demo-container-app-dev-uksouth-1"
}

variable "container_app_name" {
  description = "The container app env name"
  type        = string
  default     = "blend-containerapp-dev-uksouth-1"
}
