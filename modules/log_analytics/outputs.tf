output "id" {
  description = "Log Analytics workspace resource ID."
  value       = azurerm_log_analytics_workspace.this.id
}

output "name" {
  description = "Log Analytics workspace name."
  value       = azurerm_log_analytics_workspace.this.name
}

output "workspace_id" {
  description = "Workspace (customer) ID."
  value       = azurerm_log_analytics_workspace.this.workspace_id
}

output "primary_shared_key" {
  description = "Primary shared key for the workspace."
  value       = azurerm_log_analytics_workspace.this.primary_shared_key
  sensitive   = true
}
