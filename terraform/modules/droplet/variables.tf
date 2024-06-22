variable "do_token" {
  description = "The DigitalOcean PAT. Value saved in LastPass."
}

variable "image" {
  description = "The image to use for the droplet."
}

variable "name" {
  description = "The name of the droplet."
}

variable "pvt_key" {
  description = "My SSH private key. Value saved in LastPass."
}

variable "region" {
  description = "The region to create the droplet in."
}

variable "size" {
  description = "The size of the droplet."
}