# terraform {
#   backend "local" {
#     path = "../state/terraform.tfstate"
#   }
# }

terraform {
  cloud {

    organization = "mtc-tf-2025-smartinpo"

    workspaces {
      name = "dev"
    }
  }
}
