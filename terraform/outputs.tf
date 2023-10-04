output "droplet_name" {
  value = digitalocean_droplet.hello-world.name
}

output "droplet_id" {
  value = digitalocean_droplet.hello-world.id
}

output "droplet_ipv4_address" {
  value = digitalocean_droplet.hello-world.ipv4_address
}

output "droplet_memory" {
  value = digitalocean_droplet.hello-world.memory
}

output "droplet_vcpus" {
  value = digitalocean_droplet.hello-world.vcpus
}
