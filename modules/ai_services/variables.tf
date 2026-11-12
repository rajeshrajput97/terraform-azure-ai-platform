variable "name" {
  type        = string
  description = "Name of the Azure OpenAI / Cognitive Services account."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group for the account."
}

variable "location" {
  type        = string
  description = "Azure region for the account. Must be a region that offers Azure OpenAI."
}

variable "kind" {
  type        = string
  description = "Account kind. Use OpenAI for Azure OpenAI, or AIServices for the broader Azure AI Services resource."
  default     = "OpenAI"
}

variable "sku_name" {
  type        = string
  description = "SKU for the account."
  default     = "S0"
}

variable "custom_subdomain_name" {
  type        = string
  description = "Custom subdomain, required for private endpoints and for Azure OpenAI."
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Whether the account is reachable over the public internet."
  default     = false
}

variable "local_auth_enabled" {
  type        = bool
  description = "Whether access keys are enabled. Prefer managed identity."
  default     = false
}

variable "enable_private_endpoint" {
  type        = bool
  description = "Whether to create a private endpoint for the account."
  default     = false
}

variable "private_endpoint_subnet_id" {
  type        = string
  description = "Subnet ID for the private endpoint. Required when enable_private_endpoint is true."
  default     = null
}

variable "private_dns_zone_id" {
  type        = string
  description = "Optional Private DNS zone ID (privatelink.openai.azure.com or privatelink.cognitiveservices.azure.com)."
  default     = null
}

variable "log_analytics_workspace_id" {
  type        = string
  description = "Optional Log Analytics workspace ID for diagnostic settings."
  default     = null
}

variable "chat_deployment_name" {
  type        = string
  description = "Optional chat model deployment name. Leave null to skip the deployment resource."
  default     = null
}

variable "chat_model_name" {
  type        = string
  description = "Chat model name, used when chat_deployment_name is set."
  default     = "gpt-4o-mini"
}

variable "chat_model_version" {
  type        = string
  description = "Chat model version, used when chat_deployment_name is set."
  default     = "2024-07-18"
}

variable "embedding_deployment_name" {
  type        = string
  description = "Optional embedding model deployment name. Leave null to skip the deployment resource."
  default     = null
}

variable "embedding_model_name" {
  type        = string
  description = "Embedding model name, used when embedding_deployment_name is set."
  default     = "text-embedding-3-small"
}

variable "embedding_model_version" {
  type        = string
  description = "Embedding model version, used when embedding_deployment_name is set."
  default     = "1"
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to the account."
  default     = {}
}
