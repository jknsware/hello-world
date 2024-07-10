remote_state {
  backend = "s3"
  config = {
    encrypt        = true
    bucket         = "hello-world-jware-terraform-state"
    key            = "${path_relative_to_include()}/tf.tfstate"
    region         = "us-east-2"
    dynamodb_table = "tf-locks"
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}