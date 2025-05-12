terraform {
  cloud {

    organization = "mtc-tf-2025-smartinpo"

    workspaces {
      name = "ecs"
    }
  }
}

# terraform {
#   backend "s3" {
#     bucket       = "mtc-app-state-9525"
#     key          = "terraform.tfstate"
#     region       = "us-east-1"
#     use_lockfile = true
#   }
# }