output "id" {
  description = "Azure OpenAI / AI Services account resource ID."
  value       = azurerm_cognitive_account.this.id
}

output "name" {
  description = "Account name."
  value       = azurerm_cognitive_account.this.name
}

output "endpoint" {
  description = "Account endpoint."
  value       = azurerm_cognitive_account.this.endpoint
}

output "principal_id" {
  description = "System-assigned managed identity principal ID."
  value       = azurerm_cognitive_account.this.identity[0].principal_id
}

output "chat_deployment_name" {
  description = "Chat deployment name, if created."
  value       = try(azurerm_cognitive_deployment.chat[0].name, null)
}

output "embedding_deployment_name" {
  description = "Embedding deployment name, if created."
  value       = try(azurerm_cognitive_deployment.embedding[0].name, null)
}
