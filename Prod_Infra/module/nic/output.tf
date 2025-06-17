output "nic_ids" {
  value = { for k, nic in azurerm_network_interface.nic : k => nic.id }
}

output "public_ip_ids" {
  value = { for k, pip in data.azurerm_public_ip.pip : k => pip.id }  # Use data source for PIP IDs
}

output "nsg_ids" {
  value = { for k, nsg in data.azurerm_network_security_group.nsg : k => nsg.id }  # Use data source for NSG IDs
}

