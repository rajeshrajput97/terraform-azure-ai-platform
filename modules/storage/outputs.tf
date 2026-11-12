output "id" {
  description = "Storage account resource ID."
  value       = azurerm_storage_account.this.id
}

output "name" {
  description = "Storage account name."
  value       = azurerm_storage_account.this.name
}

output "primary_dfs_endpoint" {
  description = "Primary ADLS Gen2 (dfs) endpoint."
  value       = azurerm_storage_account.this.primary_dfs_endpoint
}

output "primary_blob_endpoint" {
  description = "Primary blob endpoint."
  value       = azurerm_storage_account.this.primary_blob_endpoint
}

output "container_names" {
  description = "Names of the created containers."
  value       = [for c in azurerm_storage_container.this : c.name]
}
