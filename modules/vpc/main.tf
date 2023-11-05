resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr_block 
    tags = {
        Name = var.vpc_name
    }
}

resource "aws_subnet" "publicsubnet" {
    count                   = 3
    vpc_id                  = aws_vpc.main.id
    cidr_block              = element(var.public_subnet_cidr, count.index)
    map_public_ip_on_launch = "true"
    availability_zone       = element(var.public_availability_zones, count.index)
    tags = {
        Name = var.public_subnet_name[count.index]
    }
}

resource "aws_subnet" "privatesubnet" {
    count             = 3
    vpc_id            = aws_vpc.main.id
    cidr_block        = element(var.private_subnet_cidr, count.index)
    availability_zone = element(var.private_availability_zones, count.index)
    tags = {
        Name = var.private_subnet_name[count.index]
    }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = var.internet_gateway
  }
}

resource "aws_route_table" "publicRT" {
  vpc_id       = aws_vpc.main.id
  route {
    cidr_block     = var.cidr_block
    gateway_id     = aws_internet_gateway.main.id
  }
  tags = {
    Name = var.route_table_public
  }
}

resource "aws_route_table_association" "publicRT_association" {
    count          = length(var.public_subnet_cidr)
    subnet_id      = element(aws_subnet.publicsubnet[*].id, count.index)
    route_table_id = aws_route_table.publicRT.id
}

resource "aws_nat_gateway" "ngw" {
  allocation_id     = var.elastic_ip
  subnet_id         = aws_subnet.publicsubnet[0].id
  tags = {
    Name = var.nat_gateway
  }
}

resource "aws_route_table" "privateRT" {
    vpc_id = aws_vpc.main.id 
    route {
        cidr_block     = var.cidr_block
        nat_gateway_id = aws_nat_gateway.ngw.id
    }
    tags = {
        Name   = var.route_table_private
    }
}

resource "aws_route_table_association" "privateRT_association"  {
     count          = length(var.private_subnet_cidr)
     subnet_id      = element(aws_subnet.privatesubnet[*].id, count.index)
     route_table_id = aws_route_table.privateRT.id
}



