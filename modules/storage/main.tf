
terraform {
  required_providers {
    powerflex = {
      version = "1.0.0"
      source  = "dell/powerflex"
    }
 
  }
}
provider "powerflex" {
  username = "admin"
  password = "Password123!"
  endpoint = "https://192.168.0.11"
  insecure = true
}

data "powerflex_storage_pool" "default_pool"{
 protection_domain_name="pd1"
}
output "storage_default_pool"{
  value=data.powerflex_storage_pool.default_pool
}
# resource "powerflex_volume" "tf-datastore-1" {
#   name                   = "datastore-1"
#   size                   = 16
#   storage_pool_name      = var.pflex_default_pool
#   protection_domain_name = "pd1"
#   access_mode            = "ReadWrite"
#   sdc_list = [
#     {
#       sdc_name    = var.hosts.pflex[0]
#       access_mode = "ReadWrite"
#     }
#   ]
# }

# data "powerflex_sdc" "main_esxi" {
#   name = var.hosts.pflex[0]
# }

# variable "hosts" {
#   type        = map(any)
#   description = "List of ESXi hosts connected to PowerFlex"
#   default = {
#     esxi  = ["esxi"]
#     pflex = ["ESXI"]
#   }
# }

# variable "pflex_default_pool" {
#   type        = string
#   description = "Default PowerFlex Pool ID to work on"
# }







