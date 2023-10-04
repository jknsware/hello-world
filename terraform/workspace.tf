terraform {
  backend "remote" {
    organization = "jknsware-hello-world"
    workspaces {
      prefix = "hello-world" # https://stackoverflow.com/questions/73480400/what-does-the-workspaces-not-supported-message-mean-when-running-terraform-wo
    }
  }
}