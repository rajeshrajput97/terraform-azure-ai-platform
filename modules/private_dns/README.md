# private_dns

Creates Private DNS zones used by this platform and links them to the workload virtual network:

- `privatelink.vaultcore.azure.net`
- `privatelink.blob.core.windows.net`
- `privatelink.dfs.core.windows.net`
- `privatelink.openai.azure.com`
- `privatelink.azuredatabricks.net`

## Example

```hcl
module "private_dns" {
  source              = "../../modules/private_dns"
  resource_group_name = module.resource_group.name
  virtual_network_id  = module.network.virtual_network_id
  tags                = { env = "dev" }
}
```
