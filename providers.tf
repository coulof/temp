terraform {
  required_providers {
    powerflex = {
      version = "0.0.1"
      source  = "dell/powerflex"
    }
    vsphere = {
      source = "hashicorp/vsphere"
    }
  }
}
