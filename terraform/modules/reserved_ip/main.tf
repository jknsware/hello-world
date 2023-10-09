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

resource "digitalocean_reserved_ip" "ip" {
  region = var.region
}

data "tfe_outputs" "hello-world" {
  organization = "jknsware-hello-world"
  workspace    = "hello-world-reserved_ip"
}
