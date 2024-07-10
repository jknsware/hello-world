terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_key_pair" "key" {
  key_name   = var.key_name
  public_key = var.public_key
  tags_all   = {
    Terraform   = "true"
    Environment = "hello-world"
  }
}