output "zone_ids" {
  description = "Map of Private DNS zone resource IDs keyed by vault, blob, dfs, openai, and databricks."
  value       = { for k, z in azurerm_private_dns_zone.this : k => z.id }
}
