variable "aws_region" {
    type   = string
    default = "us-east-1"
  
}

variable "vpc" {
  type    = object({
    vpc_name                   = string
    vpc_cidr_block             = string
    public_subnet_name         = list(string)
    private_subnet_name        = list(string)
    public_subnet_cidr         = list(string)
    private_subnet_cidr        = list(string)
    elastic_ip                 = string 
    private_availability_zones = list(string)
    public_availability_zones  = list(string)
    route_table_private        = string
    nat_gateway                = string
    route_table_public         = string
    internet_gateway           = string
 })
}
 
variable "instance" {
  type    = object({
    instance_sg_name        = string
    inbound_ports           = list(number)
    subnet_cidr             = list(string)
    })

}

variable "rds" {
  type    = object({
    rds_sg_name        = string
    allocated_storage  = number
    storage_type       = string
    instance_class     = string
    engine             = string
    engine_version     = string
    name               = string
    username           = string
    password           = string
    rds_subnet         = string
    identifier         = string
    })
}


variable "lb" {
type = object ({
    lb_name           = string
    lb_sg             = string
    target_group_name = string
    })
}


variable "asg" {
  type    = object({
    inbound_ports     = list(number)
    instance_sg_name  = string
    key_name          = string
    name              = string
    instance_type     = string
    image             = string
    autoscaling_name  = string
    db_username       = string
    db_user_password  = string
    db_name           = string
    instance_name     = string
    })
}

