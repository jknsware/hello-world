include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules//kubernetes-cluster"
}

inputs = {
    name = "jknsware"
    region = "sfo3"
    k8s_version = "1.30.1-do.0"
    node_pool_name = "hello-world"
    node_pool_size = "s-1vcpu-2gb"
    node_pool_count = 1
}