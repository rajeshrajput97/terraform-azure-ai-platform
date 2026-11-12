output "id" {
  description = "Databricks workspace resource ID."
  value       = azurerm_databricks_workspace.this.id
}

output "name" {
  description = "Databricks workspace name."
  value       = azurerm_databricks_workspace.this.name
}

output "workspace_url" {
  description = "Workspace URL."
  value       = azurerm_databricks_workspace.this.workspace_url
}

output "workspace_id" {
  description = "Databricks workspace ID."
  value       = azurerm_databricks_workspace.this.workspace_id
}

output "managed_resource_group_id" {
  description = "Managed resource group ID."
  value       = azurerm_databricks_workspace.this.managed_resource_group_id
}
