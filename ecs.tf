# provider "aws" {
#   region = local.region
# }

locals {


  tags = {
    Name       = "atlantis-ecs"
    Repository = "https://github.com/terraform-aws-modules/terraform-aws-ecs"
  }
}

################################################################################
# Ecs Module
################################################################################

module "ecs" {
  source = "terraform-aws-modules/ecs/aws"

  cluster_name = "atlantis-ecs"

  cluster_configuration = {
    execute_command_configuration = {
      logging = "OVERRIDE"
      log_configuration = {
        # You can set a simple string and ECS will create the CloudWatch log group for you
        # or you can create the resource yourself as shown here to better manage retetion, tagging, etc.
        # Embedding it into the module is not trivial and therefore it is externalized
        cloud_watch_log_group_name = aws_cloudwatch_log_group.this.name
      }
    }
  }

  # Capacity provider
  fargate_capacity_providers = {
    FARGATE = {
      default_capacity_provider_strategy = {
        weight = 50
        base   = 20
      }
    }
    FARGATE_SPOT = {
      default_capacity_provider_strategy = {
        weight = 50
      }
    }
  }

  tags = local.tags
}

# output "ecs_cluster_name" {
#   value = module.ecs.cluster_name
# #   module.<module_name>.<output_value_name>
# }

# module "ecs_disabled" {
#   source = "terraform-aws-modules/ecs/aws"

#   create = false
# }

################################################################################
# Supporting Resources
################################################################################

resource "aws_cloudwatch_log_group" "this" {
  name              = "/aws/ecs/atlantis-ecs"
  retention_in_days = 7

  tags = local.tags
}




# resource "aws_ecs_task_definition" "ecs_fargate_atlantis" {
#   family                   = "atlantis"
#   requires_compatibilities = ["FARGATE"]
#   cpu                      = 1024
#   memory                   = 2048

#   container_definitions = <<DEFINITION
# [
#   {
#     "image": "ghcr.io/runatlantis/atlantis",
#     "cpu": 1024,
#     "memory": 2048,
#     "name": "atlantis",
#     "portMappings": [
#       {
#         "containerPort": 3000,
#         "hostPort": 3000
#       }
#     ]
#   }
# ]
# DEFINITION
# }

# # resource "aws_security_group" "ecs_fargate_atlantis_task" {
# #   name        = "atlantis-task-security-group"
# #   vpc_id      = aws_vpc.main.id

# #   ingress {
# #     protocol        = "tcp"
# #     from_port       = 3000
# #     to_port         = 3000
# #     security_groups = [aws_security_group.lb.id]
# #   }

# #   egress {
# #     protocol    = "-1"
# #     from_port   = 0
# #     to_port     = 0
# #     cidr_blocks = ["0.0.0.0/0"]
# #   }
# # }

# resource "aws_ecs_cluster" "main" {
#   name = "ecs_fargate_atlantis-cluster"
# }

# resource "aws_ecs_service" "ecs_fargate_atlantis" {
#   name            = "ecs_fargate_atlantis-service"
#   cluster         = aws_ecs_cluster.main.id
#   task_definition = aws_ecs_task_definition.ecs_fargate_atlantis.arn
#   desired_count   = var.app_count
#   launch_type     = "FARGATE"

#   #   network_configuration {
#   #     security_groups = [aws_security_group.hello_world_task.id]
#   #     subnets         = aws_subnet.private.*.id
#   #   }

#   #   depends_on = [aws_lb_listener.hello_world]
# }