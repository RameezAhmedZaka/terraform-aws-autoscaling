module "vpc_module" { 
    source                     = "./vpc"
    vpc_name                   = var.vpc.vpc_name
    vpc_cidr_block             = var.vpc.vpc_cidr_block
    public_subnet_name         = var.vpc.public_subnet_name
    private_subnet_name        = var.vpc.private_subnet_name
    public_subnet_cidr         = var.vpc.public_subnet_cidr
    private_subnet_cidr        = var.vpc.private_subnet_cidr
    elastic_ip                 = var.vpc.elastic_ip
    private_availability_zones = var.vpc.private_availability_zones
    public_availability_zones  = var.vpc.public_availability_zones
    route_table_private        = var.vpc.route_table_private
    nat_gateway                = var.vpc.nat_gateway
    route_table_public         = var.vpc.route_table_public
    internet_gateway           = var.vpc.internet_gateway
    
}

module "instance_module" { 
    source                = "./instance"
    vpc_id                = module.vpc_module.vpc_id
    instance_sg_name      = var.instance.instance_sg_name
    inbound_ports         = var.instance.inbound_ports
    subnet_cidr           = var.instance.subnet_cidr  
    
}

module "rds_module" {
    source                 = "./RDS"
    rds_sg_name            = var.rds.rds_sg_name
    vpc_id                 = module.vpc_module.vpc_id
    instance_sg_id         = module.instance_module.instance_sg_id
    rds_subnet             = var.rds.rds_subnet 
    allocated_storage      = var.rds.allocated_storage
    storage_type           = var.rds.storage_type
    engine                 = var.rds.engine
    engine_version         = var.rds.engine_version  
    instance_class         = var.rds.instance_class 
    identifier             = var.rds.identifier
    name                   = var.rds.name
    username               = var.rds.username
    password               = var.rds.password
    private_subnet_id      = module.vpc_module.private_subnet_id
    private_subnet_id2     = module.vpc_module.private_subnet_id2
    
}

module "lb_module" {
    source                 = "./LB"
    vpc_id                 = module.vpc_module.vpc_id
    public_subnet_id       = module.vpc_module.public_subnet_id
    public_subnet_id2      = module.vpc_module.public_subnet_id2
    lb_name                = var.lb.lb_name
    lb_sg                  = var.lb.lb_sg
    target_group_name      = var.lb.target_group_name
}

module "asg_module" {
    source             = "./ASG"
    vpc_id             = module.vpc_module.vpc_id
    db_RDS             = module.rds_module.db_RDS
    target_group_arn   = module.lb_module.target_group_arn
    public_subnet_id   = module.vpc_module.public_subnet_id
    public_subnet_id2  = module.vpc_module.public_subnet_id2
    instance_sg_id     = module.instance_module.instance_sg_id
    inbound_ports      = var.asg.inbound_ports
    instance_sg_name   = var.asg.instance_sg_name
    key_name           = var.asg.key_name
    name               = var.asg.name
    instance_type      = var.asg.instance_type
    image              = var.asg.image
    autoscaling_name   = var.asg.autoscaling_name
    db_username        = var.asg.db_username
    db_user_password   = var.asg.db_user_password
    db_name            = var.asg.db_name
    instance_name      = var.asg.instance_name
    }