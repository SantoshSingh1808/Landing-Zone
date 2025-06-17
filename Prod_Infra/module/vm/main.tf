resource "azurerm_linux_virtual_machine" "Linux_vm" {
  for_each              = var.vm
  name                  = each.value.vm_name
  resource_group_name   = each.value.resource_group_name
  location              = each.value.location
  size                  = "Standard_B1s"
  admin_username        = "santosh"
  admin_password        = data.azurerm_key_vault_secret.secrets.value
  disable_password_authentication = false
  network_interface_ids = [var.nic_ids[each.key]]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}