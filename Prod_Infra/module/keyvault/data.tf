data "azurerm_key_vault_secret" "existing_secret" {
  name         = "santosh"
  key_vault_id = azurerm_key_vault.my_key_vault.id

  depends_on = [azurerm_key_vault_secret.secrets]
}

