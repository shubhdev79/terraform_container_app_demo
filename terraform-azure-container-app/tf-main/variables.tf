variable "app_required" {
   type = bool
   default = false
}

variable "env" {
    type = string
    description = "DEV,TEST, REF & PROD"
}

variable "az_region" {}
