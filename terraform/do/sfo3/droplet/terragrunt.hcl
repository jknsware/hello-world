include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules//droplet"
}

dependencies {
  paths = ["../reserved_ip"]
}

inputs = {
  name   = "hello-world"
  image  = "ubuntu-22-04-x64"
  region = "sfo3"
  size   = "s-1vcpu-1gb"
}