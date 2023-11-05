output "elb_dns_name" {
  value = aws_lb.elb.dns_name
}

output "lb_sg_id" {
  value = aws_security_group.lb_sg.id
}

output "target_group_arn" {
  value = aws_lb_target_group.wordpress_target_group.arn
}
