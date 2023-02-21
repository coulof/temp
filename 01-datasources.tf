data "powerflex_storagepool" "all" {
  protection_domain_name = var.pflex_protection_domain
}

data "powerflex_storagepool" "default" {
  storage_pool_names     = [var.pflex_default_pool]
  protection_domain_name = var.pflex_protection_domain
}

data "powerflex_volume" "all" {
}

data "powerflex_protection_domain" "all" {
}

data "powerflex_sdc" "all" {
}

data "powerflex_sds" "all" {
  protection_domain_name = var.pflex_protection_domain
}

data "powerflex_snapshotpolicy" "all" {
}

output "display-all" {
  value = data.powerflex_snapshotpolicy.all
}
