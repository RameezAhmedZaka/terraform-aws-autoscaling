variable "vpc_name" {
  description = "name of vpc"
  type        = string
}   
variable "vpc_cidr_block"{
  description = "CIDR block for vpc"
  type        = string
}

variable "public_subnet_name" {
  description = " name of subnet"
  type        = list(string)

}

variable "private_subnet_name" {
  description = "name of subnet"
  type        = list(string)

}

variable "public_subnet_cidr" {
  description = "List of CIDR blocks for public subnet"
  type        = list(string)
}

variable "private_subnet_cidr" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}
variable "internet_gateway" {
  description = "Name of Internet Gateway"    
  type        = string 

}

variable "route_table_public" {
  description = "name of route table"
  type        = string

}

variable "nat_gateway" {
  description = "name of nat gateway"
  type        = string

}

variable "route_table_private" {
  description = "name of route table"
  type        = string

}

variable "cidr_block" {
  description = "ip of cidr_block"
  type        = string
  default     = "0.0.0.0/0"

}

variable "elastic_ip" {
  description = "ip of eip"
  type        = string
}

variable "private_availability_zones" {
  type    = list(string)
  
}

variable "public_availability_zones" {
  type    = list(string)

}

