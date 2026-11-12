# ai_services

Creates an Azure OpenAI (or Azure AI Services) account with a system-assigned identity, optional chat and embedding deployments, and an optional private endpoint.

Model names and versions are variables so they can be changed without editing the module. Deployments are skipped when the corresponding name is left `null`.

## Example

```hcl
module "ai_services" {
  source                     = "../../modules/ai_services"
  name                       = "oai-aip-dev"
  resource_group_name        = module.resource_group.name
  location                   = module.resource_group.location
  custom_subdomain_name      = "oai-aip-dev"
  enable_private_endpoint    = true
  private_endpoint_subnet_id = module.network.private_endpoint_subnet_id
  chat_deployment_name       = "chat"
  embedding_deployment_name  = "embeddings"
  tags                       = { env = "dev" }
}
```
