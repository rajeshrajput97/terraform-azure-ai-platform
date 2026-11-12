variable "name" {
  type        = string
  description = "Name of the Key Vault (3-24 characters, globally unique)."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group for the Key Vault."
}

variable "location" {
  type        = string
  description = "Azure region for the Key Vault."
}

variable "sku_name" {
  type        = string
  description = "Key Vault SKU (standard or premium)."
  default     = "standard"
}

variable "soft_delete_retention_days" {
  type        = number
  description = "Soft-delete retention period in days."
  default     = 7
}

variable "purge_protection_enabled" {
  type        = bool
  description = "Whether purge protection is enabled. Enable in production."
  default     = false
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Whether the Key Vault is reachable over the public internet."
  default     = false
}

variable "enable_private_endpoint" {
  type        = bool
  description = "Whether to create a private endpoint for the vault."
  default     = false
}

variable "private_endpoint_subnet_id" {
  type        = string
  description = "Subnet ID for the private endpoint. Required when enable_private_endpoint is true."
  default     = null
}

variable "private_dns_zone_id" {
  type        = string
  description = "Optional Private DNS zone ID for privatelink.vaultcore.azure.net."
  default     = null
}

variable "log_analytics_workspace_id" {
  type        = string
  description = "Optional Log Analytics workspace ID for diagnostic settings."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to the Key Vault."
  default     = {}
}
