terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_droplet" "hello-world" {
  image  = var.image
  name   = var.name
  region = var.region
  size   = var.size
  ssh_keys = [
    data.digitalocean_ssh_key.jasonjknsware.id
  ]

  connection {
    host        = self.ipv4_address
    user        = "root"
    type        = "ssh"
    private_key = var.pvt_key
    timeout     = "2m"
  }
}

resource "digitalocean_reserved_ip_assignment" "hello-world" {
  ip_address = data.tfe_outputs.hello-world.nonsensitive_values.reserved_ip_address
  droplet_id = digitalocean_droplet.hello-world.id
}

data "digitalocean_ssh_key" "jasonjknsware" {
  name = "jasonjknsware"
}

data "tfe_outputs" "hello-world" {
  organization = "jknsware-hello-world"
  workspace    = "hello-world-reserved_ip"
}
