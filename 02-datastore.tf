resource "powerflex_volume" "tf-datastore-1" {
  name                   = "datastore-1"
  size                   = 16
  storage_pool_name      = var.pflex_default_pool
  protection_domain_name = var.pflex_protection_domain
  access_mode            = "ReadWrite"
  sdc_list = [
    {
      sdc_name    = var.hosts.pflex[0]
      access_mode = "ReadWrite"
    }
  ]
}

data "powerflex_sdc" "main_esxi" {
  name = var.hosts.pflex[0]
}

# Introduce a small delay to allow the volume to appear in the VMware disk rescan
resource "time_sleep" "wait_10_seconds" {
  depends_on = [resource.powerflex_volume.tf-datastore-1]

  create_duration = "10s"
}

data "vsphere_vmfs_disks" "available" {
  depends_on     = [time_sleep.wait_10_seconds]
  host_system_id = data.vsphere_host.main_esxi_host.id
  rescan         = true
  filter         = "eui"
}

output "available_disks" {
  value = data.vsphere_vmfs_disks.available
}

# The disk id is built of PowerFlex System ID + Volume ID
resource "vsphere_vmfs_datastore" "tf-datastore-1" {
  depends_on     = [data.vsphere_vmfs_disks.available]
  name           = "tf-datastore-1"
  host_system_id = data.vsphere_host.main_esxi_host.id
  disks          = ["eui.${data.powerflex_sdc.main_esxi.sdcs[0].system_id}${resource.powerflex_volume.tf-datastore-1.id}"]
}

output "disks" {
  value = [
    data.vsphere_vmfs_disks.available,
    resource.vsphere_vmfs_datastore.tf-datastore-1,
    "eui.${data.powerflex_sdc.main_esxi.sdcs[0].system_id}${resource.powerflex_volume.tf-datastore-1.id}"
  ]
}
