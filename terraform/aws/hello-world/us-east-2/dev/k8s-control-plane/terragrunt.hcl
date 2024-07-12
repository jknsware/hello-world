terraform {
  source = "tfr:///terraform-aws-modules/ec2-instance/aws?version=5.6.1"
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
  name = "k8s-control-plane"

  instance_type               = "t3.small"
  ami                         = "ami-0862be96e41dcbf74"
  key_name                    = "jasonjknsware"
  monitoring                  = false
  vpc_security_group_ids      = ["sg-020e4aada48db6970"]
  subnet_id                   = "subnet-0b3f91be9838ad282"
  associate_public_ip_address = true

  tags = {
    Terraform   = "true"
    Environment = "hello-world"
  }
}