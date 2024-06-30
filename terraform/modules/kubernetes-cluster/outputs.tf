output "cluster_name" {
  value = digitalocean_kubernetes_cluster.cluster.name
}

output "cluster_id" {
  value = digitalocean_kubernetes_cluster.cluster.id
}

output "cluster_subnet" {
  value = digitalocean_kubernetes_cluster.cluster.cluster_subnet
}

output "service_subnet" {
  value = digitalocean_kubernetes_cluster.cluster.service_subnet
}

