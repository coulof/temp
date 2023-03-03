module "compute" {
  source = "./modules/compute"
}

module "storage" {
  source = "./modules/storage"
}

output "powerflex_pool"{
  value=module.storage.storage_default_pool
}


