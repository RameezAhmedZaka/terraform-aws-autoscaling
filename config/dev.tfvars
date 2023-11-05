     vpc = {
    vpc_name                   = "my-vpc" 
    vpc_cidr_block             = "10.0.0.0/16" 
    public_subnet_name         = ["public_subnet-1", "public_subnet-2", "public_subnet-3"]  
    private_subnet_name        = ["private_subnet-1", "private_subnet-2", "private_subnet-3"]  
    public_subnet_cidr         = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]   
    private_subnet_cidr        = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]   
    elastic_ip                 = "eipalloc-0688016058ca54c94" 
    public_availability_zones  = ["us-east-1a", "us-east-1b", "us-east-1c"]
    private_availability_zones = ["us-east-1d", "us-east-1e", "us-east-1f"] 
    internet_gateway           = "MYIGW"  
    route_table_public         = "Public-Route-Table"  
    nat_gateway                = "MYNATGW"  
    route_table_private        = "Private-Route-Table" 

    }    


    instance = {
    instance_sg_name      = "wordpress-SG"
    inbound_ports         = ["22", "443", "80"]
    subnet_cidr           = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
    }

    rds = {
    rds_sg_name            = "rds-sg"
    rds_subnet             = "rds-subnet-group"
    allocated_storage      = 20
    storage_type           = "gp2"
    engine                 = "mysql"
    engine_version         = "5.7"
    instance_class         = "db.t2.micro" 
    identifier             = "rds"
    name                   = "database1"
    username               = "wordpress"
    password               = "wordpress123!"
    }
    
    lb = {
    lb_name                = "wordpress-elb"
    lb_sg                  = "wordpress-elb-sg"
    target_group_name      = "wordpress-target-group"
    }

    asg = {
    inbound_ports     = ["22", "443", "80"]
    instance_sg_name  = "wordpress-SG"
    image             = "ami-00c6177f250e07ec1"
    instance_type     = "t2.micro"
    key_name          = "ubuntu-key"
    name              = "wordpress"
    autoscaling_name  = "wordpress-ASG"
    db_username       = "wordpress"
    db_user_password  = "wordpress123!"
    db_name           = "database1"
    instance_name     = "Wordpress-server"
    }

    