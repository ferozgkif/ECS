variable "region" {
  default = "us-east-1"
}

/*==========================
      AWS ECS Cluster
===========================*/

########
variable "ecs_cluster_name" {
  description = "Name of the cluster (up to 255 letters, numbers, hyphens, and underscores)"
  type        = string
  default     = "ecs-1"
}

/*==========================
      AWS ECS Service
===========================*/

variable "aws_ecs_service_name" {
  type        = string
  description = "service name"
  default     = "demo_ecs_svc"
}

variable "cluster_id" {
  type        = string
  description = "service name"
  default     = "demo_ecs_svc"
}

variable "app_port" {
  type        = number
  description = "Port number of the application contianer"
  default     = 80
}

variable "app_count" {
  type        = number
  description = "Number of replicas of the pod"
  default     = 2
}


# /*====================================
#       AWS ECS Task definition
# =====================================*/

variable "aws_ecs_task_def_fam" {
  type        = string
  description = "demo_ecs_fam"
  default     = "demo_ecs_fam"
}

variable "fargate_cpu" {
  type        = number
  description = "enter required number of cpus"
  default     = 1024
}

variable "fargate_memory" {
  type        = number
  description = "Enter required memory"
  default     = 2048
}


# variable "aws_ecr_repository" {
#   type        = string
#   description = "ECR repo name"
#   default     = "demo_ecs_app"
# }

variable "ecs_task_execution_role" {
  type    = string
  default = "ecsTaskExecutionRole"
}






