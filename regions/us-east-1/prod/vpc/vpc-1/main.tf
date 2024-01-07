module "vpc" {
  source = "git::https://github.com/komalkanth/aws-tf-modules.git//vpc"

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
  default_tags = {
    environment  = "prod"
    organization = "kkoncloud.com"
  }
}

module "ec2-public-instance" {
  source           = "git::https://github.com/komalkanth/aws-instance-modules.git//ec2"
  deploy_instances = false

  instance_type = "t2.micro"
  key_name      = "general-usea1-key-1"
  instance_to_cidr_map = {
    "instance_1" : "10.1.0.0/24"
    "instance_2" : "10.1.1.0/24"
  }
  public_subnet_cidr_id_map = module.vpc.public_subnet_cidr_id_map
  public_security_group_ids = []
  region                    = module.vpc.region
  organization              = module.vpc.organization
  environment               = module.vpc.environment
  default_tags              = module.vpc.default_tags

}



output "locals_output" {
  value = module.vpc
}

output "ec2_instance_output" {
  value = module.ec2-public-instance
}