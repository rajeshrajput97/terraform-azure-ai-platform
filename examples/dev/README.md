# Dev environment example

Composes every module in this repository into a non-production Azure AI platform: resource group, virtual network with Databricks subnets, Log Analytics, Key Vault, ADLS Gen2, Azure OpenAI, and a Databricks workspace.

Compared with the production example, this environment uses shorter log and soft-delete retention, locally redundant storage, no Key Vault purge protection, and a public Databricks workspace front end (cluster nodes still have no public IP).

## Usage

```bash
cp terraform.tfvars.example terraform.tfvars
# Set subscription_id and a unique_suffix that will not collide globally
terraform init
terraform plan
```

Do not apply this example to a subscription you do not intend to use. Some resources, including Azure OpenAI, require pre-existing quota in the chosen region.
