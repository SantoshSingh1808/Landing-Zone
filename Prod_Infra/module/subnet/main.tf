resource "azurerm_subnet" "subnet" {
  for_each             = var.subnet
  name                 = each.value.subnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.vnet_name
  address_prefixes     = each.value.address_prefixes
}

resource "azurerm_subnet_network_security_group_association" "subnet_nsg_association" {
  for_each = {
    for key, value in var.subnet : key => value if contains(keys(var.nsg_ids), key)
  }

  subnet_id                 = azurerm_subnet.subnet[each.key].id
  network_security_group_id = var.nsg_ids[each.key]
}

