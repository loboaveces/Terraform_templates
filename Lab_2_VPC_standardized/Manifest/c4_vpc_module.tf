# Create VPC Terraform Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.4.0"

  # VPC Basic Details
  name = "${local.name}-${var.vpc_name}" //from c3_local_values.tf
  cidr = var.vpc_cidr_block  //from c4_vpc_variables.tf

  azs             = var.vpc_availability_zones  //from c4_vpc_variables.tf
  public_subnets  = var.vpc_public_subnets  //from c4_vpc_variables.tf
  private_subnets = var.vpc_private_subnets  //from c4_vpc_variables.tf

  # Database Subnets
  database_subnets = var.vpc_database_subnets  //from c4_vpc_variables.tf
  create_database_subnet_group = var.vpc_create_database_subnet_group  //from c4_vpc_variables.tf
  create_database_subnet_route_table = var.vpc_create_database_subnet_route_table  //from c4_vpc_variables.tf
  # create_database_internet_gateway_route = true
  # create_database_nat_gateway_route = true
  
  # NAT Gateways - Outbound Communication
  enable_nat_gateway = var.vpc_enable_nat_gateway //from c4_vpc_variables.tf
  single_nat_gateway = var.vpc_single_nat_gateway //from c4_vpc_variables.tf

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true


  tags = local.common_tags
  vpc_tags = local.common_tags

  # Additional Tags to Subnets
  public_subnet_tags = {
    Type = "Public Subnets"
  }
  private_subnet_tags = {
    Type = "Private Subnets"
  }  
  database_subnet_tags = {
    Type = "Private Database Subnets"
  }
}