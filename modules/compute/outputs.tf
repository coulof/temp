output "all_cluster" {
  value = data.vsphere_compute_cluster.compute_cluster
}

# output "hosts" {
#   value = var.hosts
# }

output "available_disks" {
  value = data.vsphere_vmfs_disks.available
}

output "disks" {
  value = [
    data.vsphere_vmfs_disks.available
    #resource.vsphere_vmfs_datastore.tf-datastore-1,
    #"eui.${data.powerflex_sdc.main_esxi.sdcs[0].system_id}${resource.powerflex_volume.tf-datastore-1.id}"
  ]
}
