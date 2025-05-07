## Prerequisites and Setup Instructions

- Install [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) (version 1.0 or later)
- Install and login to [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- Run `az login` to authenticate with your Azure subscription
- Ensure you have access/permissions to create resources in Azure for your subscription



## Directory Structure

```plaintext
terraform-azure-container-app/
├── tf-env
│   └── dev
│       ├── demo.txt
│       └── main.tf
├── tf-main
│   ├── container_app.tf
│   └── variables.tf
└── tf-modules
    └── container_app
        ├── container.tf
        ├── outputs.tf
        └── variables.tf

```

## Deployment Steps

1. Navigate to your environment directory, e.g. `tf-env/dev`:

    ```bash
    cd tf-env/dev
    ```

2. Initialize Terraform to download required providers and modules:

    ```bash
    terraform init
    ```

3. Review the execution plan:

    ```bash
    terraform plan -var-file=../../tf-main/variables.tf
    ```

4. Apply the configuration:

    ```bash
    terraform apply -var-file=../../tf-main/variables.tf
    ```

5. After successful apply, note the output for the public URL of the Container App.

## Assumptions / Requirements

- Azure CLI is installed and user is logged in (`az login`)
- Variables file exists with required input variables in `tf-main/variables.tf`
- Terraform modules are referenced correctly in your environment `main.tf` (`tf-env/dev/main.tf`) — adjust paths as needed based on your usage
- You have permission to create resource groups, Log Analytics workspaces, container app environments, and container apps in your Azure subscription
- The container image used is publicly accessible (default: `nginx:latest`)
- State files and sensitive files should be managed securely (e.g., using remote state or ignoring local state files)

## Expected Outputs

- The Terraform apply will output the fully qualified domain name (URL) for the deployed Azure Container App, which will be publicly accessible.
- Example output:

    ```
    container_app_url = "https://example-containerapp.<region>.azurecontainerapps.io"
    ```
