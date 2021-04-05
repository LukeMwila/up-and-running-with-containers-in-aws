resource "aws_ecs_service" "main" {
  name            = "${var.app_name}-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.main.family
  desired_count   = var.app_count
  launch_type     = "FARGATE"

  network_configuration {
    security_groups = ["${var.aws_security_group_ecs_tasks_id}"]
    subnets         = var.private_subnet_ids
  }

  load_balancer {
    target_group_arn = var.nlb_target_group_arn
    container_name   = var.app_name
    container_port   = var.app_port
  }

  depends_on = [
    aws_ecs_task_definition.main,
  ]
}
