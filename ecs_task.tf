resource "aws_ecs_task_definition" "my_first_task" {
  family                   = "my-first-task" # Naming our first task
  container_definitions    = <<DEFINITION
  [
    {
      "name": "my-first-task",
      "image": "ghcr.io/runatlantis/atlantis",
      "essential": true,
      "portMappings": [
        {
          "containerPort": 4141,
          "hostPort": 4141
        }
      ],
      "memory": 512,
      "cpu": 256,
      "environment": ${jsonencode(var.my_env_variables)}
    }
  ]
  DEFINITION
  requires_compatibilities = ["FARGATE"] # Stating that we are using ECS Fargate
  network_mode             = "awsvpc"    # Using awsvpc as our network mode as this is required for Fargate
  memory                   = 512         # Specifying the memory our container requires
  cpu                      = 256         # Specifying the CPU our container requires
  #   execution_role_arn       = "${aws_iam_role.ecsTaskExecutionRole.arn}"
}

variable "my_env_variables"{
  default = [
        {
              "name": "ATLANTIS_GH_USER",
              "value": "asimdaud"
            },
            {
              "name": "ATLANTIS_GH_TOKEN",
              "value": "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"
            },
            {
              "name": "ATLANTIS_REPO_ALLOWLIST",
              "value": "github.com/asimdaud/Terraform-atlantis-test"
            }
      ]
}

# resource "aws_iam_role" "ecsTaskExecutionRole" {
#   name               = "ecsTaskExecutionRole"
#   assume_role_policy = "${data.aws_iam_policy_document.assume_role_policy.json}"
# }

# data "aws_iam_policy_document" "assume_role_policy" {
#   statement {
#     actions = ["sts:AssumeRole"]

#     principals {
#       type        = "Service"
#       identifiers = ["ecs-tasks.amazonaws.com"]
#     }
#   }
# }

# resource "aws_iam_role_policy_attachment" "ecsTaskExecutionRole_policy" {
#   role       = "${aws_iam_role.ecsTaskExecutionRole.name}"
#   policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
# }