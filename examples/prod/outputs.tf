output "resource_group_name" {
  description = "Resource group that holds the platform resources."
  value       = module.resource_group.name
}

output "virtual_network_id" {
  description = "Workload virtual network ID."
  value       = module.network.virtual_network_id
}

output "log_analytics_workspace_id" {
  description = "Log Analytics workspace resource ID."
  value       = module.log_analytics.id
}

output "key_vault_uri" {
  description = "Key Vault URI."
  value       = module.key_vault.uri
}

output "storage_account_name" {
  description = "ADLS Gen2 storage account name."
  value       = module.storage.name
}

output "storage_dfs_endpoint" {
  description = "ADLS Gen2 DFS endpoint."
  value       = module.storage.primary_dfs_endpoint
}

output "openai_endpoint" {
  description = "Azure OpenAI account endpoint."
  value       = module.ai_services.endpoint
}

output "openai_chat_deployment" {
  description = "Azure OpenAI chat deployment name, if created."
  value       = module.ai_services.chat_deployment_name
}

output "databricks_workspace_url" {
  description = "Azure Databricks workspace URL."
  value       = module.databricks.workspace_url
}
