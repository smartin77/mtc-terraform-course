locals {
  repos = {
    infra = {
      lang     = "terraform",
      filename = "main.tf"
      pages    = true
    },
    backend = {
      lang     = "python",
      filename = "main.py"
      pages    = false
    }
  }
  environments = toset(["dev", "prod"])
}

module "repos" {
  source   = "./modules/dev-repos"
  for_each = local.environments
  repo_max = 9
  env      = each.key
  repos    = local.repos
}

module "deploy-key" {
  for_each = toset(flatten([for k, v in module.repos : keys(v.clone-urls) if k == "dev"]))
  source    = "./modules/deploy-key"
  repo_name = each.key
}

output "repo-info" {
  value = { for k, v in module.repos : k => v.clone-urls }
}

output "repo-list" {
  value = flatten([for k, v in module.repos : keys(v.clone-urls) if k == "dev"])
}