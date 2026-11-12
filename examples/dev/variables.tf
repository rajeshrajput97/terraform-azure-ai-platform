variable "subscription_id" {
  type        = string
  description = "Azure subscription ID used by the AzureRM provider."
}

variable "name_prefix" {
  type        = string
  description = "Short prefix used in resource names (letters and numbers only work best for storage accounts)."
  default     = "aip"
}

variable "environment" {
  type        = string
  description = "Environment name used in resource names and tags (for example dev or prod)."
}

variable "unique_suffix" {
  type        = string
  description = "Short unique suffix so globally named resources (storage, Key Vault, OpenAI) do not collide."
  default     = "001"
}

variable "location" {
  type        = string
  description = "Azure region for all resources in this example."
  default     = "eastus"
}

variable "address_space" {
  type        = list(string)
  description = "Virtual network address space."
}

variable "databricks_public_subnet_prefix" {
  type        = string
  description = "CIDR for the Databricks host subnet."
}

variable "databricks_private_subnet_prefix" {
  type        = string
  description = "CIDR for the Databricks container subnet."
}

variable "private_endpoint_subnet_prefix" {
  type        = string
  description = "CIDR for the private-endpoint subnet."
}

variable "log_retention_days" {
  type        = number
  description = "Log Analytics retention in days."
}

variable "storage_replication_type" {
  type        = string
  description = "Storage account replication type."
}

variable "key_vault_purge_protection_enabled" {
  type        = bool
  description = "Whether Key Vault purge protection is enabled."
}

variable "key_vault_soft_delete_days" {
  type        = number
  description = "Key Vault soft-delete retention in days."
}

variable "databricks_sku" {
  type        = string
  description = "Azure Databricks workspace SKU."
}

variable "databricks_public_network_access_enabled" {
  type        = bool
  description = "Whether the Databricks workspace front end is public."
}

variable "databricks_enable_private_endpoint" {
  type        = bool
  description = "Whether to create a private endpoint for the Databricks workspace front end."
}

variable "chat_deployment_name" {
  type        = string
  description = "Optional Azure OpenAI chat deployment name. Set to null to skip."
  default     = "chat"
}

variable "embedding_deployment_name" {
  type        = string
  description = "Optional Azure OpenAI embedding deployment name. Set to null to skip."
  default     = "embeddings"
}

variable "tags" {
  type        = map(string)
  description = "Additional tags merged with the standard platform tags."
  default     = {}
}
