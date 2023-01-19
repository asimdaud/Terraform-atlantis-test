terraform {
  required_providers {
    # docker = {
    #   source  = "kreuzwerker/docker"
    #   version = "~> 2.20.0"
    # }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}


locals {
  region = "eu-west-2"

}






# provider "aws" {
#   region = "us-west-2"
# }

# resource "aws_instance" "app_server" {
#   ami           = "ami-08d70e59c07c61a3a"
#   instance_type = "t2.micro"

#   tags = {
#     Name = "ExampleAppServerInstance"
#   }
# }


# # GitHub personal access token = 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
# # webhook secret string = epsfbegwaiantdbucylccsmhdmmakleqebtbwiprxmxojidcnnircjpukktbqngmdxvmgjmadnfpzqmjvgaxhnetfiecptlyjdkuhgjhfvjqzizofamldxeugkzvmspj


# # module "atlantis" {
# #   source  = "terraform-aws-modules/atlantis/aws"
# #   version = "~> 3.0"

# #   name = "atlantis"

# #   # VPC
# #   cidr            = "10.20.0.0/16"
# #   azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
# #   private_subnets = ["10.20.1.0/24", "10.20.2.0/24", "10.20.3.0/24"]
# #   public_subnets  = ["10.20.101.0/24", "10.20.102.0/24", "10.20.103.0/24"]


# #   create_route53_record = false
# #   # DNS (without trailing dot)
# #   #   route53_zone_name = "example.com"

# #   # ACM (SSL certificate) - Specify ARN of an existing certificate or new one will be created and validated using Route53 DNS
# #     # certificate_arn = "arn:aws:acm:eu-west-1:135367859851:certificate/70e008e1-c0e1-4c7e-9670-7bb5bd4f5a84"

# #   # Atlantis
# #   atlantis_github_user       = "asimdaud"
# #   atlantis_github_user_token = "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"
# #   atlantis_repo_allowlist    = ["github.com/terraform-aws-modules/*"]

# #   custom_environment_variables = [
# #     {
# #       name : "ATLANTIS_REPO_CONFIG_JSON",
# #       value : jsonencode(yamldecode(file("${path.module}/server-atlantis.yaml"))),
# #     },
# #   ]

# # }

provider "aws" {
  region = "eu-west-2"
}

# resource "null_resource" "cluster" {}


2
 

################################################################################
# VPC Module
################################################################################

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
