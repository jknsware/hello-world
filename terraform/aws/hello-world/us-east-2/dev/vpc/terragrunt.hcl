terraform {
  source = "tfr:///terraform-aws-modules/vpc/aws?version=5.9.0"
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region = "us-east-2"
}
EOF
}

include "root" {
  path = find_in_parent_folders()
}

inputs = {
    name = "hello-world"
    cidr = "172.16.0.0/16"

    azs             = ["us-east-2a", "us-east-2b", "us-east-2c"]
    private_subnets = ["172.16.1.0/24", "172.16.2.0/24", "172.16.3.0/24"]
    public_subnets  = ["172.16.101.0/24", "172.16.102.0/24", "172.16.103.0/24"]

    enable_nat_gateway = true
    enable_vpn_gateway = false

    tags = {
      Terraform = "true"
      Environment = "hello-world"
    }
}