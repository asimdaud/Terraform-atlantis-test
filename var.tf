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

variable "app_count" {
  type    = number
  default = 1
}

# variable "AMI" {
#   type = map(any)

#   default = {
#     eu-west-2 = "ami-03dea29b0216a1e03"
#     us-east-1 = "ami-0c2a1acae6667e438"
#   }
# }

# # variable "PRIVATE_KEY_PATH" {
# #   type = string
# #   default = "b3BlbnNzaC1rZXktdjEAAAAACmFlczI1Ni1jdHIAAAAGYmNyeXB0AAAAGAAAABCd8+1ViPaZdjrWML3uOW2DAAAAEAAAAAEAAAGXAAAAB3NzaC1yc2EAAAADAQABAAABgQDeA84eQNUdPrNqK0P0qiQ8xThOH49M0G11Z/6aOr/81ldPCDTQ+GcHOiXhQxfua4Knfq/fNvtsfil+qDj6McOAQ9p6N/X3NUDj7PKx+NVIRjN4wGZrm+1mVj4fd2sjd37OB4jDOvpe9CDpJ5jFNXGQQ9xEZmUhNUxvmmV6mj6GE3+a0kxDnq2sEbMxfQe5tSczOiQN7Aqe64Zxlfqw1X4KESeisOk39FW5xAIj/CqqN9wozDHaOJz5nV/g99TbG+80Z9WPR5yAYGs1Wou0kXVwqv5vrd9/8IjbAU22G7DwCc/KHZza6tll0RsgyjLkBlFfLLhGS17rz2Zwpmy8TcLtY/RqRTmGw2xCusAkVG+nyLavoYopIooaS7uiRNRsIdwxU8LBk5HpskhcS5YPEe66GAnMNLUu2czmWeIgltua/yeobclo/cpVs18H4cS4L6DlfELG9swtAuQhkYp/pv9CwOQampKIa/7cJisx+AUssnLgIIREeyWfDqNOgTgEErcAAAWAW/aBjisQIJDcudNWyS9OJdXQ+Z8HbpuWk0YlDo6mK6g+GQq1hj8OlOWdBE5lzYUX1aPd8B0FgcBDDrxWApHNROYpg4iuHOJF38G2mwRKSRdfkyGX4cLSVZQziLSG3we0+bREYL0JK3YavPg1NK47Q/5lcNr4484+T8sYS5eWgSLJeIPI78KJm3ACmmBuplIuNuoJT12zfdiPPlgrIkoC3CiQH176CjFUjRDo++TawKfyzuVASd5SgCj15bkXohyPXekVJW/tLYJclVzTt78ylZHF3rSthkns8g+GYyxIvM09I621f/1XGRJQ9XUO9K/QXUqBCZ0J8MUpUuvq0FzC1FDr9Gb5QNOp/bxK1d5KHKQO7m6X6s2ZySabuw6c3F//Uc5j1hap81NCspCyeVvWMMhxI0dp2yZFaVf1GJcfkhxnoTxTj5fgHItmFzpWRWAMNnDjmLxNPC4y+QNGLyYmaTCkIAZWDpOrq19mgXryQ0ZrM/t8MxQMQE0ijJWqAOEOBXCn+oOUP75AsDufuZlKj/m4GRTS3LYUNl2wa+COubyKOEOk8zDiDyrW3qqUYcMAn+zOudR6tmYdyH62tJZTCCpYZORYBGM28IMAgI8f/rpHZPAt+hNrGfD5NuUQiUfnh0w1Y0IuNIXWuufouhutjfPsNCFQsNwxdvzx0NvjogUNPI9nV67lhCSAtNiEeX99lK1FSoD2TyIcpQW94QVyna+qr+HRNBvPZtfZ3co+k3aXq5Nz0G51HB5gP9TFmP6ICDmKI6YF7O3m7R2Qa1l8fd+D6BwD5D0ky0CupddCOme7mo/PhoZtFL889Bk1jjtF0YvJRtKATKuFmZ69/Byddc/+Ewjtxxkd4XdieFmwHeM+lu57JC4HlIYgB3S/Oau+Zv0YE4kua8huhdO8kC/ixebfbWDWs+U3Myk4gcZ7VlA0ukRUzJ7Je4AYXD9DYRei3uS+tmOcR8fF+SA9t6FEKxNt6rTJoZnKznsSDkwa/angwP97KhFVYzYVCFCKYRpvuUYGDcDBcGFnLBCEEiqQtSRJpXMrgb4i4Iu9hrXhc7mGDSvc28l69dHQkvj3GmvCvY4+LGC/ZIaI2viGsG9lBMsioA24zunt9Pw6S33kXQMbKN4F3fn5OPab2icFT4aZNvHtdZfyfkWOdcB/zDwNot+i1IU518nhBOttDttfUNbIh6RLo4wJ0VyuHDKBp/RWHsvC6as2hCzxj3G3gv0gm3AZp4gMXbOTxI0K675lGI5dR4I/gnuslvTMcYEeKAWdYXNk4NGz/XnzAuj5YeaUOpWwu66Q9AWDFvWcTDGQi+Ka779HVShkmWfANuvW+/ycxVyMyAfEXnp1RPUZGP9+VxB5kpPszsylT6FH6vV/34gqajnOHLXcmmTtJl5vBwIFfPPAQWr3icw9ca7cLXQ7UU/Ni08VM4ZfQ3lTbnG50MH8PHGXSh4vPqjueqCF1/NYhRhdlRsx2otw7AvGZdXhYjcZ9slh4XmF8NlzoB8AOM7302JILQK9dOirZ2JiNqrnvck/s0RPK1o1wESwIU1/kMWrmsFKwyQK1jUKyUr/JIz5qhJCpmnA6NVWMM8KdFbHlWpvAL05r5Ko5n4VbnUYln5hMfZXQ60tEIoPLVTm5pYau+ByI4Cc37L5kOc/EM9I3RJ0nsNCURtVaaGHOsFObYitiD5T8gxvcq+vv+oEWDTjJyHTw/QX2lOQ2dA/Yqwt9z+rqIzT12SzwLOi1MrwvEanEWKiUxFrB3zapuoK7sHnGpIRWCKSDG0ymAxTx7r8jYLdSn+9fw2+85jmKiIETolme9ZbHZ5MKNAyGt2Wuc4LSaIGUYUcx3M5Euwp/K2F6z1OUepiL22IJZrAGzvHsg==" 
# # }

# # variable "PUBLIC_KEY_PATH" {
# #   type = string
# #   default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDeA84eQNUdPrNqK0P0qiQ8xThOH49M0G11Z/6aOr/81ldPCDTQ+GcHOiXhQxfua4Knfq/fNvtsfil+qDj6McOAQ9p6N/X3NUDj7PKx+NVIRjN4wGZrm+1mVj4fd2sjd37OB4jDOvpe9CDpJ5jFNXGQQ9xEZmUhNUxvmmV6mj6GE3+a0kxDnq2sEbMxfQe5tSczOiQN7Aqe64Zxlfqw1X4KESeisOk39FW5xAIj/CqqN9wozDHaOJz5nV/g99TbG+80Z9WPR5yAYGs1Wou0kXVwqv5vrd9/8IjbAU22G7DwCc/KHZza6tll0RsgyjLkBlFfLLhGS17rz2Zwpmy8TcLtY/RqRTmGw2xCusAkVG+nyLavoYopIooaS7uiRNRsIdwxU8LBk5HpskhcS5YPEe66GAnMNLUu2czmWeIgltua/yeobclo/cpVs18H4cS4L6DlfELG9swtAuQhkYp/pv9CwOQampKIa/7cJisx+AUssnLgIIREeyWfDqNOgTgEErc= Asim@YEET"
# # }


