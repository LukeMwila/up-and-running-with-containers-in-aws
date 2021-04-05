variable "app_name" {
  type        = string
  description = "Name of the container application"
}

variable "vpc_tag_name" {
  type        = string
  description = "Name tag for the VPC"
}

variable "number_of_private_subnets" {
  type        = number
  default     = 2
  description = "The number of private subnets in a VPC."
}

variable "private_subnet_tag_name" {
  type        = string
  description = "Name tag for the private subnet"
}

variable "vpc_cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block range for vpc"
}

variable "private_subnet_cidr_blocks" {
  type        = list(string)
  default     = ["10.0.0.0/24", "10.0.4.0/24"]
  description = "CIDR block range for the private subnets"
}

variable "environment" {
  type        = string
  description = "Application enviroment"
}

variable "security_group_ecs_tasks_name" {
  type        = string
  default     = "ecs-tasks-sg"
  description = "ECS Tasks security group name"
}

variable "security_group_ecs_tasks_description" {
  type        = string
  default     = "allow inbound access from the ECS ALB only"
  description = "ECS tasks security group description"
}

variable "app_port" {
  type        = string
  description = "app port"
}

variable "region" {
  type        = string
  description = "The AWS region where resources have been deployed"
}

variable "availability_zones" {
  type        = list(string)
  default     = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  description = "List of availability zones for the selected region"
}
