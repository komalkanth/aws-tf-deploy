module "vpc" {
  source        = "../../../../../aws-tf-modules/vpc/"
  region        = var.region
  vpc_main_cidr = "10.1.0.0/16"
  subnet_cidr   = ["10.1.0.0/24", "10.1.1.0/24"]
}

