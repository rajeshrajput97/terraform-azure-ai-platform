# resource_group

Creates a tagged Azure resource group. All other modules in this repository expect a resource group name and location as inputs.

## Example

```hcl
module "resource_group" {
  source   = "../../modules/resource_group"
  name     = "rg-aip-dev"
  location = "eastus"
  tags     = { env = "dev" }
}
```
