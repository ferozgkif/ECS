provider "aws" {
  region = "${var.region}"
}

terraform {
  required_version = ">= 1.0.0" # introduction of Local Values configuration language feature
}



resource "aws_ecs_cluster" "ecs_cluster" {
  name                                  = var.ecs_cluster_name

}


resource "aws_ecs_task_definition" "demo_ecs_app_def" {

  family                   = var.aws_ecs_task_def_fam
  execution_role_arn       = "arn:aws:iam::767397721018:role/ecsTaskExecutionRole"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.fargate_cpu
  memory                   = var.fargate_memory
  #   container_definitions    = data.template_file.demo_ecs_app.render
  container_definitions = jsonencode([
    {
      name   = "nginxdemos-hello"
      image  = "nginxdemos/hello"
      cpu    = var.fargate_cpu
      memory = var.fargate_memory
      portMappings = [
        {
          containerPort = var.app_port
          hostPort      = var.app_port
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "main" {
  name            = var.aws_ecs_service_name
  cluster         = var.ecs_cluster_name
  task_definition = aws_ecs_task_definition.demo_ecs_app_def.arn
  desired_count   = var.app_count
  launch_type     = "FARGATE"

  network_configuration {
    security_groups  = ["sg-0274b96441012086b"]
    subnets          = ["subnet-06f9d472e47e1524b", "subnet-068ba946c98c13848" , "subnet-0fbfba95e37cc162f"]
    assign_public_ip = true
  }


}
