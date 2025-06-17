variable "subnet" {
  description = "subnet"
  type = map(object({
    subnet_name         = string
    resource_group_name = string
    vnet_name           = string
    address_prefixes    = list(string)
  }))
  default = {}
}

variable "nsg_ids" {
  description = "Map of NSG IDs to associate with each subnet"
  type        = map(string)
}
