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
    private_key = var.pvt_key
    timeout     = "2m"
  }

  # provisioner "remote-exec" {
  #   inline = [
  #     # Install Docker
  #     "sudo apt update",
  #     "sudo apt install -y apt-transport-https",
  #     "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg",
  #     "echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu jammy stable' | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null",
  #     "sleep 30",
  #     "sudo apt update",
  #     "apt-cache policy docker-ce",
  #     "sed -i 's/#\\$nrconf{kernelhints} = -1;/\\$nrconf{kernelhints} = -1;/g' /etc/needrestart/needrestart.conf", # https://askubuntu.com/questions/1349884/how-to-disable-pending-kernel-upgrade-message
  #     "sudo apt install -y docker-ce",
  #     # Install Docker Compose
  #     "mkdir -p /root/.docker/cli-plugins/",
  #     "curl -SL https://github.com/docker/compose/releases/download/v2.22.0/docker-compose-linux-x86_64 -o /root/.docker/cli-plugins/docker-compose",
  #     "chmod +x /root/.docker/cli-plugins/docker-compose"
  #    ]    
 # }
}

data "digitalocean_ssh_key" "jasonjknsware" {
  name = "jasonjknsware"
}
