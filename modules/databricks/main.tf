resource "azurerm_databricks_workspace" "this" {
  name                          = var.name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  sku                           = var.sku
  managed_resource_group_name   = var.managed_resource_group_name
  public_network_access_enabled = var.public_network_access_enabled
  network_security_group_rules_required = (
    var.public_network_access_enabled ? null : var.network_security_group_rules_required
  )
  tags = var.tags

  custom_parameters {
    no_public_ip                                         = var.no_public_ip
    virtual_network_id                                   = var.virtual_network_id
    public_subnet_name                                   = var.public_subnet_name
    private_subnet_name                                  = var.private_subnet_name
    public_subnet_network_security_group_association_id  = var.public_subnet_nsg_association_id
    private_subnet_network_security_group_association_id = var.private_subnet_nsg_association_id
  }
}

resource "azurerm_private_endpoint" "ui_api" {
  count = var.enable_private_endpoint ? 1 : 0

  name                = "${var.name}-ui-pe"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.private_endpoint_subnet_id
  tags                = var.tags

  private_service_connection {
    name                           = "${var.name}-ui-psc"
    private_connection_resource_id = azurerm_databricks_workspace.this.id
    is_manual_connection           = false
    subresource_names              = ["databricks_ui_api"]
  }

  dynamic "private_dns_zone_group" {
    for_each = var.private_dns_zone_id == null ? [] : [var.private_dns_zone_id]
    content {
      name                 = "databricks-zone-group"
      private_dns_zone_ids = [private_dns_zone_group.value]
    }
  }
}
