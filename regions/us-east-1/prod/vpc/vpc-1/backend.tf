terraform {
  backend "s3" {
    bucket  = "saac03generalstatebucket"
    key     = "regions/us-east-1/prod/vpc/vpc-1/terraform.tfstate"
    region  = "us-east-1"
    profile = "iamadmin-general"

    /* dynamodb_table = "tfstatelock" */
  }
}