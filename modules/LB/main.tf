resource "aws_security_group" "lb_sg" {
  name        = var.lb_sg
  description = "Security group for my ELB"
  vpc_id      = var.vpc_id
dynamic "ingress" {
    for_each = var.inbound_ports

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [var.cidr_block]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.cidr_block]
  }

}

resource "aws_lb" "elb" {
  name                       = var.lb_name 
  internal                   = false            
  load_balancer_type         = "application"   
  enable_deletion_protection = false 
  enable_http2               = true 
  subnets                    = [var.public_subnet_id, var.public_subnet_id2]
  security_groups            = [aws_security_group.lb_sg.id] 
}

resource "aws_lb_target_group" "wordpress_target_group" {
  name        = var.target_group_name
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = var.vpc_id
  health_check {
    path                = "/page/index.html" 
    port                = "80"
    protocol            = "HTTP"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 2
    interval            = 5
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.elb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.wordpress_target_group.arn
  }
}







