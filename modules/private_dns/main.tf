locals {
  zones = {
    vault      = "privatelink.vaultcore.azure.net"
    blob       = "privatelink.blob.core.windows.net"
    dfs        = "privatelink.dfs.core.windows.net"
    openai     = "privatelink.openai.azure.com"
    databricks = "privatelink.azuredatabricks.net"
  }
}

resource "azurerm_private_dns_zone" "this" {
  for_each = local.zones

  name                = each.value
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "this" {
  for_each = local.zones

  name                  = "${each.key}-vnet-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.this[each.key].name
  virtual_network_id    = var.virtual_network_id
  registration_enabled  = false
  tags                  = var.tags
}
