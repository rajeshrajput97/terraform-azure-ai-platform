locals {
  prefix = "${var.name_prefix}-${var.environment}"
  tags = merge(
    {
      env        = var.environment
      workload   = "azure-ai-platform"
      managed_by = "terraform"
    },
    var.tags
  )

  # Storage accounts allow only lowercase letters and numbers, 3-24 characters.
  storage_name   = substr(replace("${var.name_prefix}${var.environment}adls${var.unique_suffix}", "-", ""), 0, 24)
  key_vault_name = "kv-${var.name_prefix}-${var.environment}-${var.unique_suffix}"
  openai_name    = "oai-${var.name_prefix}-${var.environment}-${var.unique_suffix}"
}

module "resource_group" {
  source   = "../../modules/resource_group"
  name     = "rg-${local.prefix}"
  location = var.location
  tags     = local.tags
}

module "log_analytics" {
  source              = "../../modules/log_analytics"
  name                = "log-${local.prefix}"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  retention_in_days   = var.log_retention_days
  tags                = local.tags
}

module "network" {
  source                           = "../../modules/network"
  name                             = "vnet-${local.prefix}"
  resource_group_name              = module.resource_group.name
  location                         = module.resource_group.location
  address_space                    = var.address_space
  databricks_public_subnet_prefix  = var.databricks_public_subnet_prefix
  databricks_private_subnet_prefix = var.databricks_private_subnet_prefix
  private_endpoint_subnet_prefix   = var.private_endpoint_subnet_prefix
  tags                             = local.tags
}

module "private_dns" {
  source              = "../../modules/private_dns"
  resource_group_name = module.resource_group.name
  virtual_network_id  = module.network.virtual_network_id
  tags                = local.tags
}

module "key_vault" {
  source                     = "../../modules/key_vault"
  name                       = local.key_vault_name
  resource_group_name        = module.resource_group.name
  location                   = module.resource_group.location
  purge_protection_enabled   = var.key_vault_purge_protection_enabled
  soft_delete_retention_days = var.key_vault_soft_delete_days
  enable_private_endpoint    = true
  private_endpoint_subnet_id = module.network.private_endpoint_subnet_id
  private_dns_zone_id        = module.private_dns.zone_ids["vault"]
  log_analytics_workspace_id = module.log_analytics.id
  tags                       = local.tags
}

module "storage" {
  source                     = "../../modules/storage"
  name                       = local.storage_name
  resource_group_name        = module.resource_group.name
  location                   = module.resource_group.location
  account_replication_type   = var.storage_replication_type
  enable_private_endpoint    = true
  private_endpoint_subnet_id = module.network.private_endpoint_subnet_id
  blob_private_dns_zone_id   = module.private_dns.zone_ids["blob"]
  dfs_private_dns_zone_id    = module.private_dns.zone_ids["dfs"]
  log_analytics_workspace_id = module.log_analytics.id
  tags                       = local.tags
}

module "ai_services" {
  source                     = "../../modules/ai_services"
  name                       = local.openai_name
  resource_group_name        = module.resource_group.name
  location                   = module.resource_group.location
  custom_subdomain_name      = local.openai_name
  enable_private_endpoint    = true
  private_endpoint_subnet_id = module.network.private_endpoint_subnet_id
  private_dns_zone_id        = module.private_dns.zone_ids["openai"]
  log_analytics_workspace_id = module.log_analytics.id
  chat_deployment_name       = var.chat_deployment_name
  embedding_deployment_name  = var.embedding_deployment_name
  tags                       = local.tags
}

module "databricks" {
  source                            = "../../modules/databricks"
  name                              = "dbw-${local.prefix}"
  resource_group_name               = module.resource_group.name
  location                          = module.resource_group.location
  sku                               = var.databricks_sku
  managed_resource_group_name       = "rg-${local.prefix}-dbw-managed"
  virtual_network_id                = module.network.virtual_network_id
  public_subnet_name                = module.network.databricks_public_subnet_name
  private_subnet_name               = module.network.databricks_private_subnet_name
  public_subnet_nsg_association_id  = module.network.databricks_public_nsg_association_id
  private_subnet_nsg_association_id = module.network.databricks_private_nsg_association_id
  public_network_access_enabled     = var.databricks_public_network_access_enabled
  enable_private_endpoint           = var.databricks_enable_private_endpoint
  private_endpoint_subnet_id        = module.network.private_endpoint_subnet_id
  private_dns_zone_id               = module.private_dns.zone_ids["databricks"]
  tags                              = local.tags
}
