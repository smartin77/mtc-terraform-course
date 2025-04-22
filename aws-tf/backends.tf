terraform {
  cloud {

    organization = "mtc-tf-2025-smartinpo"

    workspaces {
      name = "ecs"
    }
  }
}
