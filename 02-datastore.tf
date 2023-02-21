resource "powerflex_volume" "tf-datastore-1" {
  name                   = "datastore-1"
  size                   = 8
  storage_pool_name      = var.pflex_default_pool
  protection_domain_name = var.pflex_protection_domain
  sdc_list = [
    {
      sdc_name    = var.hosts.pflex[0]
      access_mode = "ReadWrite"
    }
  ]
}


data "vsphere_vmfs_disks" "available" {
  host_system_id = data.vsphere_host.main_esxi_host.id
  rescan         = true
  filter         = "naa"
}

#resource "vsphere_vmfs_datastore" "tf-datastore-1" {
#  name           = "tf-datastore-1"
#  host_system_id = data.vsphere_host.main_esxi_host.id
#  disks          = [data.vsphere_vmfs_disks.available.disks]
#}

output "disks" {
  value = data.vsphere_vmfs_disks.available
}
