# key_vault

Creates an Azure Key Vault with Azure RBAC authorization, a default-deny network ACL, and optional private endpoint and diagnostic settings.

## Example

```hcl
module "key_vault" {
  source                      = "../../modules/key_vault"
  name                        = "kv-aip-dev-001"
  resource_group_name         = module.resource_group.name
  location                    = module.resource_group.location
  purge_protection_enabled    = false
  enable_private_endpoint     = true
  private_endpoint_subnet_id  = module.network.private_endpoint_subnet_id
  log_analytics_workspace_id  = module.log_analytics.id
  tags                        = { env = "dev" }
}
```
