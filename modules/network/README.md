# network

Creates a Virtual Network with:

- Delegated public and private subnets for Azure Databricks VNet injection, including required NSG associations.
- A private-endpoint subnet for Key Vault, ADLS, and Azure OpenAI.

Address prefixes are configurable. The defaults assume a `10.10.0.0/16` virtual network.

## Example

```hcl
module "network" {
  source              = "../../modules/network"
  name                = "vnet-aip-dev"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  tags                = { env = "dev" }
}
```
