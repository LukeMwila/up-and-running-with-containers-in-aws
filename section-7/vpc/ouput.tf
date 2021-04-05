output vpc_id {
  value = aws_vpc.custom_vpc.id
}

output private_subnet_ids {
  value = aws_subnet.private_subnet.*.id
}

output nlb_arn {
  value = aws_lb.nlb.arn
}

output nlb_dns {
  value = aws_lb.nlb.dns_name
}

output nlb_target_group_arn {
  value = aws_lb_target_group.nlb_tg.arn
}

output ecs_tasks_security_group_id {
  value = aws_security_group.ecs_tasks.id
}
