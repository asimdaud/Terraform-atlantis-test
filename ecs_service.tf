
resource "aws_ecs_service" "my_first_service" {
  name            = "my-first-service"                        # Naming our first service
  cluster         = module.ecs.cluster_name                   # Referencing our created Cluster
  task_definition = aws_ecs_task_definition.my_first_task.arn # Referencing the task our service will spin up
  launch_type     = "FARGATE"
  desired_count   = 1 # Setting the number of containers we want deployed to 3

  network_configuration {
    # subnets = ["${aws_default_subnet.default_subnet_a.id}", "${aws_default_subnet.default_subnet_b.id}", "${aws_default_subnet.default_subnet_c.id}"]

    # subnets          = ["${local.region}a", "${local.region}b", "${local.region}c"]
    subnets          = ["${module.vpc.public_subnets[0]}", "${module.vpc.public_subnets[1]}", "${module.vpc.public_subnets[2]}"]
    assign_public_ip = true # Providing our containers with public IPs
  }
}