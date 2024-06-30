variable "do_token" {
  description = "The DigitalOcean PAT. Value saved in LastPass."
}

variable "name" {
  description = "The name to include in the Kubernetes cluster ID."
  type = string
}

variable "region" {
  description = "The US region to deploy to."
  type = string

  validation {
    condition = contains(["nyc1", "nyc3", "sfo2", "sfo3"], var.region)
    error_message = "Valid variable value must be nyc1, nyc3, sfo2, sfo3."
  }
}

variable "k8s_version" {
  description = "Grab the latest version slug from `doctl kubernetes options versions`."
  type = string
}

variable "node_pool_name" {
  description = "The name of the node pool."
  type = string
}

variable "node_pool_size" {
  description = "What size droplets for the node pool. Grab the list of versions from `doctl kubernetes options sizes`."
  type = string
}

variable "node_pool_count" {
  description = "The number of workers in the node pool."
  type = number
}