variable "vm" {
  
}
variable "nic_ids" {
  description = "Map of NIC IDs"
  type        = map(string)
}

variable "key_vault_id" {
  type = string
}
