variable "lb_name" {
    type     = string
}

variable "public_subnet_id" {
    type     = string
}

variable "public_subnet_id2" {
    type     = string
}

variable "vpc_id" {
    type     = string
}

variable "lb_sg" {
    type     = string
}

variable "target_group_name" {
    type     = string
}

variable "static_target_group_name" {
    type     = string
    default  = "static-target-group"
}

variable "inbound_ports" {
    type     = list(number)
    default  = ["443", "80", "8080"] 
}

variable "cidr_block" {
    type     = string
    default  = "0.0.0.0/0"
}
