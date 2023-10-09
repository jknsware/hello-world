# https://github.com/gruntwork-io/terragrunt/issues/779#issuecomment-588337477
generate "backend" {
  path = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "jknsware-hello-world"
    workspaces {
      prefix = "hello-world-"
    }
  }
}
EOF
}
