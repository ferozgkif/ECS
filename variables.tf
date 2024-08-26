variable "region" {
  default = "us-east-1"
}

/*==========================
      AWS ECS Cluster
===========================*/

variable "cluster_name" {
  description = "The name for the ecs Cluster"
  type        = string
}

variable "create_service_role" {
  description = "Variable to decide whether IAM Service linked role should be created for ECS"
  default     = false
  type        = bool
}


/*==========================
      AWS ECS Service
===========================*/

variable "name" {
  description = "The name for the ecs service"
  type        = string
}

variable "desired_tasks" {
  description = "The minumum number of tasks to run in the service"
  type        = string
}

variable "arn_security_group" {
  description = "ARN of the security group for the tasks"
  type        = string
}

variable "ecs_cluster_id" {
  description = "The ECS cluster ID in which the resources will be created"
  type        = string
}

variable "arn_target_group" {
  description = "The ARN of the AWS Target Group to put the ECS task"
  type        = string
}

variable "arn_task_definition" {
  description = "The ARN of the Task Definition to use to deploy the tasks"
  type        = string
}

variable "subnets_id" {
  description = "Subnet ID in which ecs will deploy the tasks"
  type        = list(string)
}

variable "container_port" {
  description = "The port that the container will listen request"
  type        = string
}

variable "container_name" {
  description = "The name of the container"
  type        = string
}


/*====================================
      AWS ECS Task definition
=====================================*/


variable "name" {
  description = "The name for Task Definition"
  type        = string
}

variable "container_name" {
  description = "The name of the Container specified in the Task definition"
  type        = string
}

variable "execution_role_arn" {
  description = "The IAM ARN role that the ECS task will use to call other AWS services"
  type        = string
}

variable "task_role_arn" {
  description = "The IAM ARN role that the ECS task will use to call other AWS services"
  type        = string
  default     = null
}

variable "cpu" {
  description = "The CPU value to assign to the container, read AWS documentation for available values"
  type        = string
}

variable "memory" {
  description = "The MEMORY value to assign to the container, read AWS documentation to available values"
  type        = string
}

variable "docker_repo" {
  description = "The docker registry URL in which ecs will get the Docker image"
  type        = string
}

variable "region" {
  description = "AWS Region in which the resources will be deployed"
  type        = string
}

variable "container_port" {
  description = "The port that the container will use to listen to requests"
  type        = number
}