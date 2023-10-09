include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../modules//reserved_ip"
}

inputs = {
  region = "sfo3"
}