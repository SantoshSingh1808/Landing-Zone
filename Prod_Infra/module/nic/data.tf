# Data source for subnet
data "azurerm_subnet" "subnet" {
  for_each = var.nic
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}

# Data source for Public IP
data "azurerm_public_ip" "pip" {
  for_each            = var.nic
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}

# Data source for Network Security Group (NSG)
data "azurerm_network_security_group" "nsg" {
  for_each            = var.nic
  name                = each.value.nsg_name
  resource_group_name = each.value.resource_group_name
}