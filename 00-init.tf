provider "powerflex" {
  username = "admin"
  password = "Password123!"
  endpoint = "https://192.168.0.11"
  insecure = true
}

provider "vsphere" {
  user     = "administrator@vsphere.local"
  password = "Password123!"
  #  vsphere_server = "vcsa.demo.local"
  vsphere_server = "192.168.1.3"

  # if you have a self-signed cert
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "datacenter" {
  name = "DataCenter"
}

data "vsphere_compute_cluster" "compute_cluster" {
  name          = "CLS01"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_host" "main_esxi_host" {
  name          = var.hosts.esxi[0]
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

output "all_cluster" {
  value = data.vsphere_compute_cluster.compute_cluster
}

output "hosts" {
  value = var.hosts
}
