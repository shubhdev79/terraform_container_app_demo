## Prerequisites and Setup Instructions

- Install [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) (version 1.0 or later)
- Install and login to [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- Run `az login` to authenticate with your Azure subscription
- Ensure you have access/permissions to create resources in Azure for your subscription
- Make sure you enable/register Resource - Microsoft.app ( To create container apps ) in your subscription.


## Directory Structure

```plaintext
terraform-azure-container-app/
├── tf-env
│   └── dev
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
    terraform plan
    ```

4. Apply the configuration:

    ```bash
    terraform apply
    ```

5. After successful apply, note the output for the public URL of the Container App.

6. Destroy the resources if they are not running ( Not Mandatory )

    ```bash
    terraform destroy
    ```

## Assumptions / Requirements

- Azure CLI is installed and user is logged in (`az login`)
- Terraform modules are referenced correctly in your environment `main.tf` (`tf-env/dev/main.tf`) — adjust paths as needed based on your usage
- You have permission to create resource groups, Log Analytics workspaces, container app environments, and container apps in your Azure subscription
- The container image used is publicly accessible (default: `nginx:latest`)
- State files and sensitive files should be managed securely (e.g., using remote state or ignoring local state files)
- You can also set the details on your CLI
    ```plaintext
    export AZURE_SUBSCRIPTION_ID="your_subscription_id"
    export AZURE_TENANT_ID="your_tenant_id"
    export AZURE_CLIENT_ID="your_client_id"
    export AZURE_CLIENT_SECRET="your_client_secret"
    ```
- Verify the Variables - echo $AZURE_SUBSCRIPTION_ID

## Expected Outputs

- The Terraform apply will output the fully qualified domain name (URL) for the deployed Azure Container App, which will be publicly accessible.
- Example output:

    ```
    container_app_url = "https://example-containerapp.<region>.azurecontainerapps.io"
    ```
- TF PLAN OUTPUT https://github.com/shubhdev79/terraform_container_app_demo/blob/main/terraform-azure-container-app/tf-env/dev/app_plan_output.txt
