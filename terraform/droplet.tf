resource "digitalocean_droplet" "hello-world" {
  image  = "ubuntu-22-04-x64"
  name   = "hello-world"
  region = "sfo3"
  size   = "s-1vcpu-1gb"
  ssh_keys = [
    data.digitalocean_ssh_key.jasonjknsware.id
  ]

  connection {
    host        = self.ipv4_address
    user        = "root"
    type        = "ssh"
    private_key = file(var.pvt_key)
    timeout     = "2m"
  }
}

data "digitalocean_ssh_key" "jasonjknsware" {
  name = "jasonjknsware"
}
