resource "aws_security_group" "instance_sg" {
  name        = var.instance_sg_name
  vpc_id      = var.vpc_id

 dynamic "ingress" {
    for_each = var.inbound_ports

    content {
      from_port       = ingress.value
      to_port         = ingress.value
      protocol        = "tcp"
      cidr_blocks     = [var.cidr_block]
    }
  
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.cidr_block]
  }

}
