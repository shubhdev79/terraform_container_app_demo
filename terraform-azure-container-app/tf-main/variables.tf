# These will get override in tf-env/main.tf

variable "app_required" {
   type = bool
   default = false
}

variable "env" { 
    type = string
    description = "DEV,TEST, REF & PROD"
}

variable "az_region" {}
