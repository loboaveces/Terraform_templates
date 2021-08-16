# In this file we create the VPC Terraform Module

module "vpc" {  //you can put any name, in this case is "vpc"
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.4.0"
  #version = "~> 3.4"
  
  # insert the 19 required variables here

  name = "vpc-test"
  cidr = "10.0.0.0/16"

  azs                 = ["us-east-1a", "us-east-1b",]  //The two AZs defined in the topology image
  private_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets      = ["10.0.11.0/24", "10.0.12.0/24"]
  #for Databases:
  database_subnets    = ["10.0.21.0/24", "10.0.22.0/24"]
  create_database_subnet_group = true
  create_database_subnet_route_table = true

  #NAT gateway for private subnets
  enable_nat_gateway = true
  single_nat_gateway = true //For dev, in production should be two like in the picture

  #VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support = true

  #Tags
  public_subnet_tags = {
      Name = "public_subnets"
  }
  private_subnet_tags = {
      Name = "private_subnets"
  }
  database_subnet_tags = {
      Name = "database_subnets"
  }
  tags = {
      Owner = "loboaveces"
      Environment = "test_terraform"
  }
  vpc_tags = {
      Name = "vpc-test"
  }
}

