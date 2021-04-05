resource "aws_api_gateway_vpc_link" "main" {
  name        = "vpc-link-${var.name}"
  target_arns = [var.nlb_arn]
}
