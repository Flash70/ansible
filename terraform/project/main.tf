terraform {
  required_providers {
    vsphere = {
      source = "hashicorp/vsphere"
      version = "2.2.0"
    }
  }
}

provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_vcenter
  allow_unverified_ssl = true
}

module "dev-db" {
  source = "../modules/create_vm_ware"
  cpu = 8
  cores-per-socket = 1
  ram = 10240
  disksize = 30
  vm-guest-id = "ubuntu64Guest"
  vsphere-unverified-ssl = "true"
  vsphere-datacenter = "HOME"
  vsphere-cluster = "SDO"
  vm-datastore = "ssd00"
  vm-network = "VM Network"
  vm-domain = "home"
  dns_server_list = ["10.10.2.10", "1.1.1.1"]
  name = "srv-db1.sdo.local"
  ipv4_address           = "10.10.2.30"
  ipv4_gateway           = "10.10.2.1"
  ipv4_netmask           = "24"
  vm-template-name       = "templete-ubuntu"
}

module "dev-1c" {
  source = "../modules/create_vm_ware"
  cpu = 4
  cores-per-socket = 1
  ram = 4096
  disksize = 10
  vm-guest-id = "ubuntu64Guest"
  vsphere-unverified-ssl = "true"
  vsphere-datacenter = "HOME"
  vsphere-cluster = "SDO"
  vm-datastore = "iSCSI"
  vm-network = "VM Network"
  vm-domain = "home"
  dns_server_list = ["10.10.2.10", "1.1.1.1"]
  name = "srv-app1.sdo.local"
  ipv4_address           = "10.10.2.31"
  ipv4_gateway           = "10.10.2.1"
  ipv4_netmask           = "24"
  vm-template-name       = "templete-ubuntu"
}
