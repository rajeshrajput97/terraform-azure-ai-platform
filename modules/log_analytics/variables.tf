variable "name" {
  type        = string
  description = "Name of the Log Analytics workspace."
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
  description = "Workspace SKU."
  default     = "PerGB2018"
}

variable "retention_in_days" {
  type        = number
  description = "Log retention in days."
  default     = 30
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to the workspace."
  default     = {}
}
