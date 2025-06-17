resource "azurerm_network_interface" "nic" {
  for_each            = var.nic
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name


  ip_configuration {
    name                          = "${each.value.nic_name}-ipconfig"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    public_ip_address_id          = data.azurerm_public_ip.pip[each.key].id
  }
  }

resource "azurerm_network_interface_security_group_association" "nic-nsg" {
  for_each                  = var.nic
  network_interface_id      = azurerm_network_interface.nic[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg[each.key].id
}
