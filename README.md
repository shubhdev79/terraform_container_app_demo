Prerequisites and setup instructions :
1. Azure Account
2. Terraform
3. AZ CLI

FLOW AND SETUP :

terraform-azure-container-app/
├── tf-env
│   └── dev
│       ├── demo.txt
│       └── main.tf
├── tf-main
│   ├── container_app.tf
│   └── variables.tf
└── tf-modules
    └── container_app
        ├── container.tf
        ├── outputs.tf
        └── variables.tf

Objective

Create a Terraform configuration to provision the following resources on Microsoft Azure using the azurerm provider:

A Resource Group
A Log Analytics Workspace (within the same Resource Group)
A Container App Environment
A Container App running a public container image (e.g., nginx or a hello-world image)

Requirements

The Container App must be publicly accessible
The deployment should output the public URL of the Container App
All resources must be provisioned in the UK South region
Follow latest stable Terraform best practices
Implement the solution using a modular Terraform structure

