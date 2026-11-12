resource "azurerm_storage_account" "this" {
  name                            = var.name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  account_tier                    = var.account_tier
  account_replication_type        = var.account_replication_type
  account_kind                    = "StorageV2"
  is_hns_enabled                  = true
  min_tls_version                 = "TLS1_2"
  https_traffic_only_enabled      = true
  public_network_access_enabled   = var.public_network_access_enabled
  shared_access_key_enabled       = var.shared_access_key_enabled
  default_to_oauth_authentication = true
  allow_nested_items_to_be_public = false
  tags                            = var.tags

  blob_properties {
    delete_retention_policy {
      days = var.blob_soft_delete_days
    }
  }
}

resource "azurerm_storage_container" "this" {
  for_each = toset(var.containers)

  name                  = each.value
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = "private"
}

resource "azurerm_private_endpoint" "blob" {
  count = var.enable_private_endpoint ? 1 : 0

  name                = "${var.name}-blob-pe"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.private_endpoint_subnet_id
  tags                = var.tags

  private_service_connection {
    name                           = "${var.name}-blob-psc"
    private_connection_resource_id = azurerm_storage_account.this.id
    is_manual_connection           = false
    subresource_names              = ["blob"]
  }

  dynamic "private_dns_zone_group" {
    for_each = var.blob_private_dns_zone_id == null ? [] : [var.blob_private_dns_zone_id]
    content {
      name                 = "blob-zone-group"
      private_dns_zone_ids = [private_dns_zone_group.value]
    }
  }
}

resource "azurerm_private_endpoint" "dfs" {
  count = var.enable_private_endpoint ? 1 : 0

  name                = "${var.name}-dfs-pe"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.private_endpoint_subnet_id
  tags                = var.tags

  private_service_connection {
    name                           = "${var.name}-dfs-psc"
    private_connection_resource_id = azurerm_storage_account.this.id
    is_manual_connection           = false
    subresource_names              = ["dfs"]
  }

  dynamic "private_dns_zone_group" {
    for_each = var.dfs_private_dns_zone_id == null ? [] : [var.dfs_private_dns_zone_id]
    content {
      name                 = "dfs-zone-group"
      private_dns_zone_ids = [private_dns_zone_group.value]
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "blob" {
  count = var.log_analytics_workspace_id == null ? 0 : 1

  name                       = "${var.name}-blob-diag"
  target_resource_id         = "${azurerm_storage_account.this.id}/blobServices/default"
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
    category = "StorageRead"
  }

  enabled_log {
    category = "StorageWrite"
  }

  enabled_log {
    category = "StorageDelete"
  }

  metric {
    category = "Transaction"
    enabled  = true
  }
}
