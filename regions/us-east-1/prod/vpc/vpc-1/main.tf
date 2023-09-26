module "vpc" {
  source = "../../../../../../aws-tf-modules/vpc"

  region = "us-east-1"

  organization = "kkoncloud.com"
  environment  = "prod"

  vpc_name      = "vpc-1"
  vpc_main_cidr = "10.1.0.0/16"
  public_subnet_cidr_map = {
    "us-east-1a" : {
      "subnet-1" : "10.1.0.0/24"
    }
    "us-east-1b" : {
      "subnet-1" : "10.1.1.0/24"
    }
    "us-east-1c" : {
      "subnet-1" : "10.1.3.0/24"
      "subnet-2" : "10.1.4.0/24"
    }
  }
  private_subnet_cidr_map = {
    "us-east-1a" : {
      "subnet-1" : "10.1.2.0/24"
    }
  }
}

module "ec2-public-instance" {
  source = "../../../../../../aws-instance-modules/ec2"
  instance_type = "t2.micro"
  key_name = "general-usea1-key-1"
  public_subnet_id = "10.1.0.0/24"
  public_security_group_ids = []
}

output "locals_output" {
  value = module.vpc
}