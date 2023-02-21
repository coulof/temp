variable "hosts" {
  type        = map(any)
  description = "List of ESXi hosts connected to PowerFlex"
  default = {
    esxi  = ["esxi"]
    pflex = ["ESXI"]
  }
}

variable "pflex_default_pool" {
  type        = string
  description = "Default PowerFlex Pool ID to work on"
}

variable "pflex_protection_domain" {
  type        = string
  description = "Default PowerFlex Protection Domain to work on"
}
