variable "instance_sg_name" {
  type       = string
}

variable "cidr_block" {
    type     = string
    default  = "0.0.0.0/0"
}

variable "subnet_cidr" {
    type    = list(string)
}

variable "inbound_ports" {
    type    = list(number)
}

variable "vpc_id" {
    type     = string
}

