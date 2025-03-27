variable "repo_count" {
  type        = number
  description = "Number of repositories"
  default     = 1

  validation {
    condition     = var.repo_count < 5
    error_message = "Do not deploy more than 5 repositories"
  }
}

variable "env" {
  type        = string
  description = "Deployment environment"
  validation {
    condition     = contains(["dev", "prod"], var.env)
    error_message = "Env must be 'dev' or 'prod'"
  }
}
