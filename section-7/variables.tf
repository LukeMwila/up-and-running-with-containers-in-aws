variable "app_name" {
  type        = string
  default     = "nodejs-express"
  description = "Name of the container application"
}

variable "app_port" {
  description = "Application port"
  default     = 8080
  type        = number
}

variable "region" {
  type        = string
  default     = "eu-west-1"
  description = "The AWS region where resources have been deployed"
}

variable "availability_zones" {
  type        = list(string)
  default     = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  description = "List of availability zones for the selected region"
}

variable "environment" {
  description = "Applicaiton environment"
  default     = "dev"
  type        = string
}
