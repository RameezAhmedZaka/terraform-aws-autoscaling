variable "rds_sg_name" {
    type = string
}

variable "vpc_id" {
    type = string
}

variable "rds_subnet" {
    type     = string
}

variable "private_subnet_id" {
    type     = string
}

variable "private_subnet_id2" {
    type     = string
}

# variable "private_sg_id" {
#     type     = string
# }

variable "instance_sg_id" {
    type     = string
}


variable "allocated_storage" {
    type = number
}

variable "storage_type" {
    type = string
}

variable "engine" {
    type = string
}

variable "engine_version" {
    type = string
}

variable "instance_class" {
    type = string
}

variable "identifier" {
    type = string
}

variable "name" {
    type = string
}

variable "username" {
    type = string
}

variable "password" {
    type = string
}
