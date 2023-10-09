output "droplet_name" {
  value = digitalocean_droplet.hello-world.name
}

output "droplet_id" {
  value = digitalocean_droplet.hello-world.id
}

output "droplet_memory" {
  value = digitalocean_droplet.hello-world.memory
}

output "droplet_vcpus" {
  value = digitalocean_droplet.hello-world.vcpus
}

output "reserved_ip" {
  value = data.tfe_outputs.hello-world.nonsensitive_values.reserved_ip_address
}