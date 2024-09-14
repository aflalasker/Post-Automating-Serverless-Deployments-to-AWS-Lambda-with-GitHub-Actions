terraform {
  required_version = "1.9.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.66.0"
    }
  }

  # Terraform backend configuration
  backend "s3" {
    bucket = "<TERRAFORM_STATE_BUCKET_NAME>"
    key    = "<S3_KEY_TO_STATE_FILE>"
    region = "<AWS_REGION>"
  }
}

provider "aws" {
  region = "<AWS_REGION>"

  # default tags to be added to all resources that supports tagging
  default_tags {
    tags = {
      repository = "https://github.com/aflalasker/Post-Automating-Serverless-Deployments-to-AWS-Lambda-with-GitHub-Actions"
      terraform  = "true"
    }
  }
}