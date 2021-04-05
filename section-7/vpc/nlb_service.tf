resource "aws_lb" "nlb" {
  name               = "nlb-${var.app_name}"
  internal           = true
  load_balancer_type = "network"
  subnets            = aws_subnet.private_subnet.*.id

  enable_deletion_protection = false

  tags = {
    Environment = var.environment
  }
}

resource "aws_lb_target_group" "nlb_tg" {
  depends_on  = [
    aws_lb.nlb
  ]
  name        = "nlb-${var.app_name}-${var.environment}-tg"
  port        = var.app_port
  protocol    = "TCP"
  vpc_id      = aws_vpc.custom_vpc.id
  target_type = "ip"
}

# Redirect all traffic from the NLB to the target group
resource "aws_lb_listener" "nlb_listener" {
  load_balancer_arn = aws_lb.nlb.id
  port              = var.app_port
  protocol    = "TCP"

  default_action {
    target_group_arn = aws_lb_target_group.nlb_tg.id
    type             = "forward"
  }
}