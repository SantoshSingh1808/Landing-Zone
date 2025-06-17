variable "nic" {
  description = "Map of NICs with details"
  type = map(object({
    nic_name            = string
    subnet_name         = string
    pip_name            = string
    nsg_name            = string
    resource_group_name = string
    location            = string
    vnet_name           = string
  }))
}
