variable "resource_group_name" {
  type        = string
  description = "Resource group for the Private DNS zones."
}

variable "virtual_network_id" {
  type        = string
  description = "Virtual network to link to each Private DNS zone."
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to the zones and links."
  default     = {}
}
