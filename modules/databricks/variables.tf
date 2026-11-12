variable "name" {
  type        = string
  description = "Name of the Azure Databricks workspace."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group for the workspace."
}

variable "location" {
  type        = string
  description = "Azure region for the workspace."
}

variable "sku" {
  type        = string
  description = "Workspace SKU (standard, premium, or trial)."
  default     = "premium"
}

variable "managed_resource_group_name" {
  type        = string
  description = "Name of the managed resource group created by Databricks."
}

variable "virtual_network_id" {
  type        = string
  description = "Virtual network ID used for workspace VNet injection."
}

variable "public_subnet_name" {
  type        = string
  description = "Name of the delegated Databricks host (public) subnet."
}

variable "private_subnet_name" {
  type        = string
  description = "Name of the delegated Databricks container (private) subnet."
}

variable "public_subnet_nsg_association_id" {
  type        = string
  description = "NSG association ID for the host subnet."
}

variable "private_subnet_nsg_association_id" {
  type        = string
  description = "NSG association ID for the container subnet."
}

variable "no_public_ip" {
  type        = bool
  description = "Whether cluster nodes are deployed without public IP addresses."
  default     = true
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Whether the workspace front end is reachable over the public internet."
  default     = true
}

variable "network_security_group_rules_required" {
  type        = string
  description = "Required NSG rules setting when public network access is disabled. Ignored by Azure when public access is enabled."
  default     = "NoAzureDatabricksRules"
}

variable "enable_private_endpoint" {
  type        = bool
  description = "Whether to create a private endpoint for the workspace UI / API."
  default     = false
}

variable "private_endpoint_subnet_id" {
  type        = string
  description = "Subnet ID for the workspace private endpoint. Required when enable_private_endpoint is true."
  default     = null
}

variable "private_dns_zone_id" {
  type        = string
  description = "Optional Private DNS zone ID for privatelink.azuredatabricks.net."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to the workspace."
  default     = {}
}
