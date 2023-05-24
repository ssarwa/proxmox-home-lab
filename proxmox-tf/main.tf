terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.7.4"
    }
  }
}

provider "proxmox" {
  pm_api_url          = "https://192.168.1.2:8006/api2/json"
  pm_api_token_id     = "tfuser@pam!tf_id"
  pm_api_token_secret = ""
  pm_tls_insecure     = true
}

resource "proxmox_vm_qemu" "k8s_master" {
  count       = 1
  name        = "k8s-master0${count.index + 1}"
  vmid        = "900"
  target_node = var.proxmox_host
  clone       = var.template_name

  # basic VM settings here. agent refers to guest agent
  agent    = 1
  os_type  = "cloud-init"
  cores    = 8
  sockets  = 1
  cpu      = "host"
  memory   = 16348
  scsihw   = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disk {
    slot     = 0
    size     = "100G"
    type     = "scsi"
    storage  = "data"
    iothread = 0
  }

  # if you want two NICs, just copy this whole network section and duplicate it
  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  # not sure exactly what this is for. presumably something about MAC addresses and ignore network changes during the life of the VM
  lifecycle {
    ignore_changes = [
      network,
    ]
  }

  ipconfig0 = "ip=192.168.1.200/24,gw=192.168.1.1"

  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
}

resource "proxmox_vm_qemu" "k8s_worker" {
  count       = 3
  name        = "k8s-worker0${count.index + 1}"
  vmid        = "90${count.index + 1}"
  target_node = var.proxmox_host
  clone       = var.template_name

  # basic VM settings here. agent refers to guest agent
  agent    = 1
  os_type  = "cloud-init"
  cores    = 8
  sockets  = 1
  cpu      = "host"
  memory   = 16348
  scsihw   = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disk {
    slot = 0
    # set disk size here. leave it small for testing because expanding the disk takes time.
    size     = "100G"
    type     = "scsi"
    storage  = "data"
    iothread = 0
  }

  # if you want two NICs, just copy this whole network section and duplicate it
  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  # not sure exactly what this is for. presumably something about MAC addresses and ignore network changes during the life of the VM
  lifecycle {
    ignore_changes = [
      network,
    ]
  }

  ipconfig0 = "ip=192.168.1.20${count.index + 1}/24,gw=192.168.1.1"

  # sshkeys set using variables. the variable contains the text of the key.
  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
}
