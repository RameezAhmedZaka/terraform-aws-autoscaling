output "vpc_id" {
  value = module.vpc_module.vpc_id
}

output "private_subnet_id" {
  value = module.vpc_module.private_subnet_id
}

output "public_subnet_id" {
  value = module.vpc_module.public_subnet_id
}

output "public_subnet_id2" {
  value = module.vpc_module.public_subnet_id2
}

output "private_subnet_id2" {
  value = module.vpc_module.private_subnet_id2
}

output "instance_sg_id" {
  value = module.instance_module.instance_sg_id
}

output "db_RDS" {
    value = module.rds_module.db_RDS
}

output "elb_dns_name" {
  value = module.lb_module.elb_dns_name
}

output "lb_sg_id" {
  value = module.lb_module.lb_sg_id
}

output "target_group_arn" {
  value = module.lb_module.target_group_arn
}
