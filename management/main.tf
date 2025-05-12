terraform {
  cloud {

    organization = "mtc-tf-2025-smartinpo"

    workspaces {
      name = "state-buckets"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

import {
  to = aws_s3_bucket.this
  id = "mtc-app-state-9525"
}

resource "aws_s3_bucket" "this" {

}