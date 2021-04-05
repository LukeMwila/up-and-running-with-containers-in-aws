variable "name" {
  type        = string
  description = "The name of the cluster"
}

variable "cluster_tag_name" {
  type        = string
  description = "Name tag for the cluster"
}

variable "app_name" {
  type        = string
  description = "Name of the container application"
}

variable "app_image" {
  type        = string
  description = "Container image to be used for application in task definition file"
}

variable "environment" {
  type        = string
  description = "The application environment"
}

variable "fargate_cpu" {
  type        = number
  description = "Fargate cpu allocation"
}

variable "fargate_memory" {
  type        = number
  description = "Fargate memory allocation"
}

variable "app_port" {
  type        = number
  description = "Application port"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "IDs for private subnets"
}

variable "vpc_id" {
  type        = string
  description = "The id for the VPC where the ECS container instance should be deployed"
}

variable "app_count" {
  type        = string
  description = "The number of instances of the task definition to place and keep running."
}

variable "aws_security_group_ecs_tasks_id" {
  type        = string
  description = "The ID of the security group for the ECS tasks"
}

variable "nlb_target_group_arn" {
  type        = string
  description = "The ARN of the NLB target group"
}
