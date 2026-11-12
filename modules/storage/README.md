# storage

Creates an Azure Data Lake Storage Gen2 account (hierarchical namespace) with bronze, silver, and gold containers, TLS 1.2, no anonymous access, and optional blob/dfs private endpoints.

## Example

```hcl
module "storage" {
  source                     = "../../modules/storage"
  name                       = "staipdev001"
  resource_group_name        = module.resource_group.name
  location                   = module.resource_group.location
  account_replication_type   = "LRS"
  enable_private_endpoint    = true
  private_endpoint_subnet_id = module.network.private_endpoint_subnet_id
  tags                       = { env = "dev" }
}
```
