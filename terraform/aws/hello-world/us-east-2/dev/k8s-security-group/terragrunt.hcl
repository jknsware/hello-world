terraform {
  source = "tfr:///terraform-aws-modules/security-group/aws?version=5.1.2"
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "us-east-2"
}
EOF
}

inputs = {
  name        = "kubernetes-access"
  description = "Security group for Kubernetes access."
  vpc_id      = "vpc-01bbb5f4ed11e04b9"

  ingress_cidr_blocks = ["172.16.0.0/16"]
  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "SSH access"
      cidr_blocks = "24.28.2.111/32"
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "SSH access - Discovery"
      cidr_blocks = "104.6.34.9/32"
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "SSH access  - Starbucks"
      cidr_blocks = "72.182.105.79/32"
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "LB HTTP access"
      cidr_blocks = "24.28.2.111/32"
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "LB HTTP access - Discovery"
      cidr_blocks = "104.6.34.9/32"
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "LB HTTP access - Starbucks"
      cidr_blocks = "72.182.105.79/32"
    },
    {
      from_port   = 0
      to_port     = 65535
      protocol    = "all"
      description = "VPC inbound"
      cidr_blocks = "172.16.0.0/16"
    }
  ]

  egress_cidr_blocks = ["0.0.0.0/0"]
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 65535
      protocol    = "all"
      description = "All outbound"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}