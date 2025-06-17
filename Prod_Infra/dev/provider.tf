terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.33.0"
    }
  }
  # backend "azurerm" {

  # }
}

provider "azurerm" {
  # Configuration options
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
  subscription_id = "9c2d44b8-0b58-4481-8de2-41223a92f641"
}
