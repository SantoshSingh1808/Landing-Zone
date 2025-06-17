variable "vnet" {
  description = "Map of virtual networks to create"
  type = map(object({
    vnet_name         = string
    address_space     = list(string)
    location          = string
    resource_group_name = string  # This is expected to be a string
  }))
}
