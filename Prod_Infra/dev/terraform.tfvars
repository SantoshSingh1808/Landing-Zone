Root_RG = {
  Rg1 = {
    name     = "sani"
    location = "eastus"
  }
}

Root_VNET = {
  vnet1 = {
    vnet_name           = "sani-vnet"
    address_space       = ["10.0.0.0/24"]
    location            = "eastus"
    resource_group_name = "sani"
  }
}

Root_NSG = {
  nsg = {
    subnet1 = {
      nsg_name            = "sani-nsg1"
      resource_group_name = "sani"
      location            = "eastus"

    }
    subnet2 = {
      nsg_name            = "sani-nsg2"
      resource_group_name = "sani"
      location            = "eastus"
    }

    # subnet3 = {
    #   nsg_name            = "sani-nsg3"
    #   resource_group_name = "sani"
    #   location            = "eastus"
    # }
  }
}

Root_SUBNET = {
  subnet = {
    subnet1 = {
      subnet_name         = "sani-frontend"
      address_prefixes    = ["10.0.0.0/26"]
      resource_group_name = "sani"
      vnet_name           = "sani-vnet"

    }
    subnet2 = {
      subnet_name         = "sani-backend"
      address_prefixes    = ["10.0.0.64/26"]
      resource_group_name = "sani"
      vnet_name           = "sani-vnet"

    }

    # subnet3 = {
    #   subnet_name         = "sani-database"
    #   address_prefixes    = ["10.0.0.128/26"]
    #   resource_group_name = "sani"
    #   vnet_name           = "sani-vnet"
    # }

    subnet3 = {
      subnet_name         = "AzureBastionSubnet"
      address_prefixes    = ["10.0.0.192/26"]
      resource_group_name = "sani"
      vnet_name           = "sani-vnet"
    }
  }
}

Root_PIP = {
  pip1 = {
    pip_name            = "sani-pip1"
    resource_group_name = "sani"
    location            = "eastus"

  }
  pip2 = {
    pip_name            = "sani-pip2"
    resource_group_name = "sani"
    location            = "eastus"
  }

  # pip3 = {
  #   pip_name            = "sani-pip3"
  #   resource_group_name = "sani"
  #   location            = "eastus"
  # }
}

Root_NIC = {
  vm1 = {
    nic_name            = "sani-nic1"
    subnet_name         = "sani-frontend"
    pip_name            = "sani-pip1"
    nsg_name            = "sani-nsg1"
    resource_group_name = "sani"
    location            = "eastus"
    vnet_name           = "sani-vnet"
  }
  vm2 = {
    nic_name            = "sani-nic2"
    subnet_name         = "sani-backend"
    pip_name            = "sani-pip2"
    nsg_name            = "sani-nsg2"
    resource_group_name = "sani"
    location            = "eastus"
    vnet_name           = "sani-vnet"
  }
  # vm3 = {
  #   nic_name            = "sani-nic3"
  #   subnet_name         = "sani-database"
  #   pip_name            = "sani-pip3"
  #   nsg_name            = "sani-nsg3"
  #   resource_group_name = "sani"
  #   location            = "eastus"
  #   vnet_name           = "sani-vnet"
  # }
}

Root_vm = {
  vm1 = {
    vm_name             = "sani-frontendvm"
    location            = "eastus"
    resource_group_name = "sani"

  }
  vm2 = {
    vm_name             = "sani-backendvm"
    location            = "eastus"
    resource_group_name = "sani"
  }

  # vm3 = {
  #   vm_name             = "sani-databasevm"
  #   location            = "eastus"
  #   resource_group_name = "sani"
  # }
}

KeyVault_Secret_Value = "Santosh@1234"
