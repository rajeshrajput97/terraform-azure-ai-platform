output "virtual_network_id" {
  description = "Virtual network resource ID."
  value       = azurerm_virtual_network.this.id
}

output "virtual_network_name" {
  description = "Virtual network name."
  value       = azurerm_virtual_network.this.name
}

output "databricks_public_subnet_name" {
  description = "Databricks host (public) subnet name."
  value       = azurerm_subnet.databricks_public.name
}

output "databricks_private_subnet_name" {
  description = "Databricks container (private) subnet name."
  value       = azurerm_subnet.databricks_private.name
}

output "databricks_public_nsg_association_id" {
  description = "NSG association ID for the Databricks host subnet."
  value       = azurerm_subnet_network_security_group_association.databricks_public.id
}

output "databricks_private_nsg_association_id" {
  description = "NSG association ID for the Databricks container subnet."
  value       = azurerm_subnet_network_security_group_association.databricks_private.id
}

output "private_endpoint_subnet_id" {
  description = "Subnet ID used for private endpoints."
  value       = azurerm_subnet.private_endpoint.id
}
