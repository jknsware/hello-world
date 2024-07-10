terraform {
  source = "tfr:///terraform-aws-modules/security-group/aws?version=5.1.2"
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

inputs = {
  name        = "kubernetes-access"
  description = "Security group for Kubernetes access."
  vpc_id      = "vpc-0f989f76aacf3366d"

  ingress_cidr_blocks      = ["10.0.0.0/16"]
  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "SSH access"
      cidr_blocks = "24.28.2.111/32"
    }
  ]
  
  egress_cidr_blocks = [
    "0.0.0.0/0"
  ]
}