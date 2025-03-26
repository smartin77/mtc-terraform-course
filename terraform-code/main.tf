resource "random_id" "random" {
  byte_length = 2
  count       = 2
}

resource "github_repository" "mtc_repo" {
  count       = 2
  name        = "mtc-repo-${random_id.random[count.index].dec}"
  description = "Code for MTC"
  visibility  = "private"
  auto_init   = true
}

resource "github_repository_file" "readme" {
  count               = 2
  repository          = github_repository.mtc_repo[count.index].name
  branch              = "main"
  file                = "README.md"
  content             = "# This repository is for infra developers"
  overwrite_on_create = true
}

resource "github_repository_file" "index" {
  count               = 2
  repository          = github_repository.mtc_repo[count.index].name
  branch              = "main"
  file                = "index.html"
  content             = "Hello Terraform!"
  overwrite_on_create = true
}

output "repo-names" {
  value       = github_repository.mtc_repo[*].name
  description = "Repository Names"
  sensitive   = true
}