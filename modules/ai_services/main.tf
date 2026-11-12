resource "azurerm_cognitive_account" "this" {
  name                          = var.name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  kind                          = var.kind
  sku_name                      = var.sku_name
  custom_subdomain_name         = var.custom_subdomain_name
  public_network_access_enabled = var.public_network_access_enabled
  local_auth_enabled            = var.local_auth_enabled
  tags                          = var.tags

  identity {
    type = "SystemAssigned"
  }

  network_acls {
    default_action = "Deny"
  }
}

resource "azurerm_cognitive_deployment" "chat" {
  count = var.chat_deployment_name == null ? 0 : 1

  name                 = var.chat_deployment_name
  cognitive_account_id = azurerm_cognitive_account.this.id

  model {
    format  = "OpenAI"
    name    = var.chat_model_name
    version = var.chat_model_version
  }

  scale {
    type = "Standard"
  }
}

resource "azurerm_cognitive_deployment" "embedding" {
  count = var.embedding_deployment_name == null ? 0 : 1

  name                 = var.embedding_deployment_name
  cognitive_account_id = azurerm_cognitive_account.this.id

  model {
    format  = "OpenAI"
    name    = var.embedding_model_name
    version = var.embedding_model_version
  }

  scale {
    type = "Standard"
  }
}

resource "azurerm_private_endpoint" "this" {
  count = var.enable_private_endpoint ? 1 : 0

  name                = "${var.name}-pe"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.private_endpoint_subnet_id
  tags                = var.tags

  private_service_connection {
    name                           = "${var.name}-psc"
    private_connection_resource_id = azurerm_cognitive_account.this.id
    is_manual_connection           = false
    subresource_names              = ["account"]
  }

  dynamic "private_dns_zone_group" {
    for_each = var.private_dns_zone_id == null ? [] : [var.private_dns_zone_id]
    content {
      name                 = "openai-zone-group"
      private_dns_zone_ids = [private_dns_zone_group.value]
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  count = var.log_analytics_workspace_id == null ? 0 : 1

  name                       = "${var.name}-diag"
  target_resource_id         = azurerm_cognitive_account.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
    category = "Audit"
  }

  enabled_log {
    category = "RequestResponse"
  }

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}
