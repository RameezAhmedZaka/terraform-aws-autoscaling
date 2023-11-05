resource "aws_security_group" "rds_sg" {
  name        = var.rds_sg_name
  vpc_id      = var.vpc_id


     ingress {
      from_port       = 3306
      to_port         = 3306
      protocol        = "tcp"
      security_groups = [var.instance_sg_id]
    }
   
  }

resource "aws_db_subnet_group" "rds_subnet" {
  name       = var.rds_subnet
  subnet_ids = [var.private_subnet_id, var.private_subnet_id2]
}

resource "aws_db_instance" "rds_instance" {
  allocated_storage      = var.allocated_storage
  storage_type           = var.storage_type
  engine                 = var.engine
  engine_version         = var.engine_version  
  instance_class         = var.instance_class 
  identifier             = var.identifier 
  name                   = var.name
  username               = var.username
  password               = var.password
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet.name
}

