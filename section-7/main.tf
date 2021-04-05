module "vpc" {
  source                        = "./vpc"
  app_name                      = var.app_name
  app_port                      = var.app_port
  number_of_private_subnets     = 2
  environment                   = var.environment
  security_group_ecs_tasks_name = var.app_name
  vpc_tag_name                  = "${var.app_name}-vpc"
  private_subnet_tag_name       = "${var.app_name}-pvt-subnets"
  availability_zones            = var.availability_zones
  region                        = var.region
}

module "ecs" {
  source                          = "./ecs"
  app_name                        = var.app_name
  app_port                        = var.app_port
  app_count                       = 2
  app_image                       = ""
  fargate_cpu                     = 1024
  fargate_memory                  = 2048
  nlb_target_group_arn            = module.vpc.nlb_target_group_arn
  name                            = var.app_name
  cluster_tag_name                = var.app_name
  vpc_id                          = module.vpc.vpc_id
  environment                     = var.environment
  aws_security_group_ecs_tasks_id = module.vpc.ecs_tasks_security_group_id
  private_subnet_ids              = module.vpc.private_subnet_ids
}

module "api_gateway" {
  source                 = "./api_gateway"
  name                   = var.app_name
  integration_input_type = "HTTP_PROXY"
  path_part              = "{proxy+}"
  app_port               = var.app_port
  nlb_dns_name           = module.vpc.nlb_dns
  nlb_arn                = module.vpc.nlb_arn
  environment            = var.environment
}

