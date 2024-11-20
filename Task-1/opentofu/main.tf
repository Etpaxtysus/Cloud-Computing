terraform {
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.8.1"
    }
  }
}

provider "libvirt" {
  uri = "qemu:///system"
}

resource "libvirt_pool" "default" {
  name = "default"
  type = "dir"

  target {
    path = "/var/lib/libvirt/images"
  }
}

resource "libvirt_volume" "ubuntu" {
  name   = "ubuntu-20.04.qcow2"
  pool   = libvirt_pool.default.name
  source = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img"
  format = "qcow2"
}

resource "libvirt_cloudinit_disk" "web_server_init" {
  name       = "web-server-init.iso"
  pool       = libvirt_pool.default.name
  user_data  = file("${path.module}/cloud-init-web.yaml")
}

resource "libvirt_cloudinit_disk" "db_server_init" {
  name       = "db-server-init.iso"
  pool       = libvirt_pool.default.name
  user_data  = file("${path.module}/cloud-init-db.yaml")
}

resource "libvirt_domain" "web_server" {
  name   = "web-server"
  memory = 1024
  vcpu   = 1

  disk {
    volume_id = libvirt_volume.ubuntu.id
  }

  disk {
    volume_id = libvirt_cloudinit_disk.web_server_init.name
  }

  network_interface {
    network_name = "default"
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  cloudinit = "${file("cloud-init-web.yaml")}"
}

resource "libvirt_domain" "db_server" {
  name   = "db-server"
  memory = 1024
  vcpu   = 1

  disk {
    volume_id = libvirt_volume.ubuntu.id
  }

  disk {
    volume_id = libvirt_cloudinit_disk.db_server_init.name
  }

  network_interface {
    network_name = "default"
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  cloudinit = "${file("cloud-init-db.yaml")}"
}

output "web_server_ip" {
  value = libvirt_domain.web_server.network_interface[0].addresses[0]
}

output "db_server_ip" {
  value = libvirt_domain.db_server.network_interface[0].addresses[0]
}
