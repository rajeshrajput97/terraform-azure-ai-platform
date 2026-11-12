# log_analytics

Creates a Log Analytics workspace used as the central destination for diagnostic settings in this platform.

## Example

```hcl
module "log_analytics" {
  source              = "../../modules/log_analytics"
  name                = "log-aip-dev"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  retention_in_days   = 30
  tags                = { env = "dev" }
}
```
