# databricks

Creates an Azure Databricks workspace with VNet injection (no public IP on cluster nodes by default) and an optional private endpoint for the workspace front end.

The network module in this repository produces the delegated subnets and NSG association IDs that this module requires.

## Example

```hcl
module "databricks" {
  source                            = "../../modules/databricks"
  name                              = "dbw-aip-dev"
  resource_group_name               = module.resource_group.name
  location                          = module.resource_group.location
  managed_resource_group_name       = "rg-aip-dev-dbw-managed"
  virtual_network_id                = module.network.virtual_network_id
  public_subnet_name                = module.network.databricks_public_subnet_name
  private_subnet_name               = module.network.databricks_private_subnet_name
  public_subnet_nsg_association_id  = module.network.databricks_public_nsg_association_id
  private_subnet_nsg_association_id = module.network.databricks_private_nsg_association_id
  tags                              = { env = "dev" }
}
```
