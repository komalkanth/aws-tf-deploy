module "vpc" {
  source = "../../../../../../aws-tf-modules/vpc"

  region = "us-east-1"

  organization = "kkoncloud.com"
  environment  = "prod"

  vpc_name            = "vpc-1"
  vpc_main_cidr       = "10.1.0.0/16"
  public_subnet_cidr  = ["10.1.0.0/24", "10.1.1.0/24"]
  private_subnet_cidr = ["10.1.2.0/24"]
}

