variable "name" {
  type        = string
  description = "Storage account name (3-24 lowercase letters and numbers, globally unique)."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group for the storage account."
}

variable "location" {
  type        = string
  description = "Azure region for the storage account."
}

variable "account_tier" {
  type        = string
  description = "Storage account tier."
  default     = "Standard"
}

variable "account_replication_type" {
  type        = string
  description = "Replication type (LRS, ZRS, GRS, or GZRS)."
  default     = "LRS"
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Whether the storage account is reachable over the public internet."
  default     = false
}

variable "shared_access_key_enabled" {
  type        = bool
  description = "Whether shared access keys are enabled. Prefer Azure AD."
  default     = false
}

variable "blob_soft_delete_days" {
  type        = number
  description = "Blob soft-delete retention in days."
  default     = 7
}

variable "containers" {
  type        = list(string)
  description = "Blob containers (file systems) to create for the lakehouse."
  default     = ["bronze", "silver", "gold"]
}

variable "enable_private_endpoint" {
  type        = bool
  description = "Whether to create blob and dfs private endpoints."
  default     = false
}

variable "private_endpoint_subnet_id" {
  type        = string
  description = "Subnet ID for private endpoints. Required when enable_private_endpoint is true."
  default     = null
}

variable "blob_private_dns_zone_id" {
  type        = string
  description = "Optional Private DNS zone ID for privatelink.blob.core.windows.net."
  default     = null
}

variable "dfs_private_dns_zone_id" {
  type        = string
  description = "Optional Private DNS zone ID for privatelink.dfs.core.windows.net."
  default     = null
}

variable "log_analytics_workspace_id" {
  type        = string
  description = "Optional Log Analytics workspace ID for diagnostic settings."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to the storage account."
  default     = {}
}
