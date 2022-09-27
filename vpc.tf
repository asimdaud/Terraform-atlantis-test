# provider "aws" {
#   region = var.region
# }



################################################################################
# VPC Module
################################################################################

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "atlantis-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["${local.region}a", "${local.region}b", "${local.region}c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  enable_ipv6     = false

  enable_nat_gateway = false
  single_nat_gateway = true

  public_subnet_tags = {
    Name = "overridden-atlantis-public"
  }

  tags = {
    Owner       = "user"
    Environment = "dev"
  }

  vpc_tags = {
    Name = "vpc-atlantis"
  }
}

resource "aws_default_subnet" "default_subnet_a" {
  availability_zone = "eu-west-2a"
}

resource "aws_default_subnet" "default_subnet_b" {
  availability_zone = "eu-west-2b"
}

resource "aws_default_subnet" "default_subnet_c" {
  availability_zone = "eu-west-2c"
}



# resource "aws_vpc" "main" {
#   cidr_block           = "10.0.0.0/16"
#   enable_dns_support   = "true"
#   enable_dns_hostnames = "true"
#   # enable_classiclink = "false"
#   #   instance_tenancy = "default"

#   tags = {
#     Name = "Project atlantis"
#   }
# }

# resource "aws_subnet" "public_subnets" {
#   count             = length(var.public_subnet_cidrs)
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = element(var.public_subnet_cidrs,3)
#   availability_zone = element(var.azs, 3)

#   tags = {
#     Name = "Public Subnet ${count.index + 1}"
#   }
# }

# resource "aws_subnet" "private_subnets" {
#   count             = length(var.private_subnet_cidrs)
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = element(var.private_subnet_cidrs, count.index)
#   availability_zone = element(var.azs, count.index)

#   tags = {
#     Name = "Private Subnet ${count.index + 1}"
#   }
# }

# # resource "aws_subnet" "prod-subnet-public-1" {
# #   vpc_id                  = aws_vpc.prod-vpc.id
# #   cidr_block              = "10.0.1.0/24"
# #   map_public_ip_on_launch = "true" //it makes this a public subnet
# #   availability_zone       = "eu-west-2a"

# #   tags =  {
# #     Name = "prod-subnet-public-1"
# #   }
# # } 