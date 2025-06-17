variable "enable_rbac" {
  type    = bool
  default = false
}

variable "secrets" {
  type = map(string)
  default = {}
}

variable "password" {
  description = "Database password (sensitive)"
  type        = string
  sensitive   = true
}
