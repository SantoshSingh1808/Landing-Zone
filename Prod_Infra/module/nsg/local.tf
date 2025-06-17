locals {
  nsgs = {
    "frontend-subnet" = {
      name  = "frontend-nsg"
      rules = [
        {
          name                       = "Allow-SSH"
          priority                   = 100
          direction                  = "Inbound"
          access                     = "Allow"
          protocol                   = "Tcp"
          destination_port_range     = "22"
          source_address_prefix      = "*"
        },
        {
          name                       = "Allow-HTTP"
          priority                   = 110
          direction                  = "Inbound"
          access                     = "Allow"
          protocol                   = "Tcp"
          destination_port_range     = "80"
          source_address_prefix      = "*"
        }
      ]
    }

    "backend-subnet" = {
      name  = "backend-nsg"
      rules = [
        {
          name                       = "Allow-SSH"
          priority                   = 100
          direction                  = "Inbound"
          access                     = "Allow"
          protocol                   = "Tcp"
          destination_port_range     = "22"
          source_address_prefix      = "*"
        },
        {
          name                       = "Allow-App-Port"
          priority                   = 110
          direction                  = "Inbound"
          access                     = "Allow"
          protocol                   = "Tcp"
          destination_port_range     = "3000"
          source_address_prefix      = "*"
        }
      ]
    }

    "database-subnet" = {
      name  = "database-nsg"
      rules = [
        {
          name                       = "Allow-SSH"
          priority                   = 100
          direction                  = "Inbound"
          access                     = "Allow"
          protocol                   = "Tcp"
          destination_port_range     = "22"
          source_address_prefix      = "*"
        },
        {
          name                       = "Allow-SQL"
          priority                   = 110
          direction                  = "Inbound"
          access                     = "Allow"
          protocol                   = "Tcp"
          destination_port_range     = "1433"
          source_address_prefix      = "*"
        }
      ]
    }
  }
}