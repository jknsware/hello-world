terraform {
  cloud {
    organization = "jknsware-hello-world"

    workspaces {
      name = "hello-world-do"
    }
  }
}