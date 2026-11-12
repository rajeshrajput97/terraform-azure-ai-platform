variable "name" {
  type        = string
  description = "Name of the virtual network."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group for the virtual network and subnets."
}

variable "location" {
  type        = string
  description = "Azure region for the virtual network."
}

variable "address_space" {
  type        = list(string)
  description = "Address space for the virtual network."
  default     = ["10.10.0.0/16"]
}

variable "databricks_public_subnet_name" {
  type        = string
  description = "Name of the Databricks host (public) subnet."
  default     = "snet-databricks-public"
}

variable "databricks_public_subnet_prefix" {
  type        = string
  description = "CIDR prefix for the Databricks host subnet."
  default     = "10.10.0.0/24"
}

variable "databricks_private_subnet_name" {
  type        = string
  description = "Name of the Databricks container (private) subnet."
  default     = "snet-databricks-private"
}

variable "databricks_private_subnet_prefix" {
  type        = string
  description = "CIDR prefix for the Databricks container subnet."
  default     = "10.10.1.0/24"
}

variable "private_endpoint_subnet_name" {
  type        = string
  description = "Name of the private-endpoint subnet."
  default     = "snet-privatelink"
}

variable "private_endpoint_subnet_prefix" {
  type        = string
  description = "CIDR prefix for the private-endpoint subnet."
  default     = "10.10.2.0/24"
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to network resources."
  default     = {}
}
