terraform {
  required_version = "1.4.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  # profile = "iamadmin-general"
}