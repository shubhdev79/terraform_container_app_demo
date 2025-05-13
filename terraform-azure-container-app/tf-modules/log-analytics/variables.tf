variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "workspace_name" {
  description = "The name of the Log Analytics workspace"
  type        = string
}

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
}
