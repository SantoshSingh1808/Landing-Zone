module "RG" {
  source = "../module/rg"
  RG     = var.Root_RG
}

module "VNET" {
  source     = "../module/vnet"
  vnet       = var.Root_VNET
  depends_on = [module.RG]
}

module "NSG" {
  source     = "../module/nsg"
  nsg        = var.Root_NSG.nsg
  depends_on = [module.VNET]
}

module "SUBNET" {
  source     = "../module/subnet"
  subnet     = var.Root_SUBNET.subnet
  nsg_ids    = module.NSG.nsg_ids
  depends_on = [module.NSG]
}

module "PIP" {
  source     = "../module/pip"
  pip        = var.Root_PIP
  depends_on = [module.SUBNET]
}

module "NIC" {
  source     = "../module/nic"
  nic        = var.Root_NIC
  depends_on = [module.PIP]
}

module "vm" {
  source        = "../module/vm"
  vm            = var.Root_vm
  nic_ids       = module.NIC.nic_ids
  key_vault_id  = module.KeyVault.key_vault_id
  depends_on    = [module.NIC]
}

module "KeyVault" {
  source        = "../module/keyvault"
  password      = var.KeyVault_Secret_Value
  depends_on    = [module.RG]
}
