# Production environment example

Composes every module in this repository into a production-leaning Azure AI platform. Differences from the dev example:

- Key Vault purge protection and 90-day soft-delete
- 90-day Log Analytics retention
- Zone-redundant storage
- Databricks workspace front end is private (private endpoint plus Private DNS)

## Usage

```bash
cp terraform.tfvars.example terraform.tfvars
# Set subscription_id and a unique_suffix that will not collide globally
terraform init
terraform plan
```

Do not apply this example to a subscription you do not intend to use. Some resources, including Azure OpenAI, require pre-existing quota in the chosen region.
