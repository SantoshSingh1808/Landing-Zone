data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "my_key_vault" {
  name                       = "sani-keyvault"
  resource_group_name        = "sani"
  location                   = "eastus"
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"
  purge_protection_enabled   = true
  soft_delete_retention_days = 7
  enable_rbac_authorization   = true

  # access_policy {
  #   tenant_id = data.azurerm_client_config.current.tenant_id
  #   object_id = data.azurerm_client_config.current.object_id

  #   secret_permissions = ["Get", "List", "Set", "Delete"]
  # }

  tags = {
    environment = "dev"
    owner       = "santosh"
  }
}

# Role Assignment - Key Vault Administrator
resource "azurerm_role_assignment" "kv_admin" {
  scope                = azurerm_key_vault.my_key_vault.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "time_sleep" "wait_for_rbac" {
  depends_on = [azurerm_role_assignment.kv_admin]
  create_duration = "30s"
}

# Secret creation
resource "azurerm_key_vault_secret" "secrets" {
  name         = "santosh"
  value        = var.password
  key_vault_id = azurerm_key_vault.my_key_vault.id
  depends_on = [time_sleep.wait_for_rbac]
}