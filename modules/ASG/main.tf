
resource "aws_launch_configuration" "template" {
  name                   = var.name
  image_id               = var.image
  instance_type          = var.instance_type
  security_groups        = [var.instance_sg_id]
  key_name               = var.key_name
  user_data              =  data.template_file.user_data.rendered
}

data "template_file" "user_data" {
  template = file("${path.module}/user_data.tpl") 
  vars = {
    db_username       = var.db_username
    db_user_password  = var.db_user_password
    db_name           = var.db_name
    db_RDS            = var.db_RDS
  
  }
}


resource "aws_autoscaling_group" "autoscaling" {
  name = var.autoscaling_name
  launch_configuration = aws_launch_configuration.template.name
  min_size = 2
  max_size = 5
  desired_capacity = 2
  vpc_zone_identifier = [var.public_subnet_id, var.public_subnet_id2]

  dynamic "tag" {
    for_each = [var.instance_name]
    content {
      key                 = "Name"
      value               = tag.value
      propagate_at_launch = true
    }
  }

  target_group_arns = [var.target_group_arn]

}
