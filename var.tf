variable "AWS_REGION" {
  default = "eu-west-2"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private Subnet CIDR"
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones"
  default     = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}

# variable "app_count" {
#   type    = number
#   default = 1
# }

