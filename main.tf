provider "aws" {
  region = "eu-west-2"
}

terraform {
  backend "s3" {
    encrypt = true    
    bucket = "asim-atlantis-test-tfstate"
    dynamodb_table = "terraform-lock"
    key    = "terraform.tfstate"
    region = "eu-west-2"
  }
}

# resource "null_resource" "cluster" {}


###############################################################################
# VPC Module
###############################################################################

# module "vpc" {
#   source = "terraform-aws-modules/vpc/aws"

#   name = "atlantis-vpc"
#   cidr = "10.50.0.0/16"

#   enable_nat_gateway = false

#   tags = {
#     Owner       = "user"
#     Environment = "dev"
#   }

#   vpc_tags = {
#     Name = "vpc-atlantis"
#   }
# }
