variable "public_subnet_id" {
    type     = string
}

variable "public_subnet_id2" {
    type     = string
}

variable "name" {
    type     = string
}

variable "instance_type" {
    type     = string
}

variable "image" {
    type     = string
}

variable "autoscaling_name" {
    type     = string
}

variable "target_group_arn" {
    type     = string
}


variable "db_RDS" {
    type     = string
}

variable "db_username" {
    type     = string
}

variable "db_user_password"{
    type     = string
}

variable "db_name"{
    type     = string
}

variable "inbound_ports" {
    type     = list(number)
   
}

variable "cidr_block" {
    type     = string
    default  = "0.0.0.0/0"
}

variable "vpc_id" {
    type     = string
}

variable "instance_sg_name" {
    type     = string
}

variable "key_name" {
    type     = string
}

variable "instance_sg_id" {
    type     = string
}

variable "instance_name" {
    type     = string
}



