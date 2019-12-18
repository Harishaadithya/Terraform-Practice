resource "aws_vpc" "Aadithya_VPC" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = "Aadithya_VPC"
  }
}

resource "aws_subnet" "Publicsubnet_1" {
  availability_zone       = "us-east-2a"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  vpc_id                  = aws_vpc.Aadithya_VPC.id

  tags = {
    Name = "Publicsubnet_1"
  }
}

resource "aws_subnet" "Publicsubnet_2" {
  availability_zone       = "us-east-2b"
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  vpc_id                  = aws_vpc.Aadithya_VPC.id

  tags = {
    Name = "Publicsubnet_2"
  }
}

resource "aws_subnet" "Publicsubnet_3" {
  availability_zone       = "us-east-2c"
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  vpc_id                  = aws_vpc.Aadithya_VPC.id

  tags = {
    Name = "Publicsubnet_3"
  }
}

resource "aws_subnet" "Privatesubnet_1" {
  vpc_id                  = aws_vpc.Aadithya_VPC.id
  availability_zone       = "us-east-2a"
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "false"

  tags = {
    Name = "Privatesubnet_1"
  }
}

resource "aws_subnet" "Privatesubnet_2" {
  vpc_id                  = aws_vpc.Aadithya_VPC.id
  availability_zone       = "us-east-2b"
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "false"

  tags = {
    Name = "Privatesubnet_2"
  }
}

resource "aws_subnet" "Privatesubnet_3" {
  vpc_id                  = aws_vpc.Aadithya_VPC.id
  availability_zone       = "us-east-2c"
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = "false"

  tags = {
    Name = "Privatesubnet_3"
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.Aadithya_VPC.id

  tags = {
    Name = "Internet_Gateway"
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.Aadithya_VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "Internet_Gateway"
  }
}

resource "aws_route_table_association" "Publicsubnet_1" {
  subnet_id      = aws_subnet.Publicsubnet_1.id
  route_table_id = aws_route_table.route_table.id

}

resource "aws_route_table_association" "Publicsubnet_2" {
  subnet_id      = aws_subnet.Publicsubnet_2.id
  route_table_id = aws_route_table.route_table.id

}

resource "aws_route_table_association" "Publicsubnet_3" {
  subnet_id      = aws_subnet.Publicsubnet_3.id
  route_table_id = aws_route_table.route_table.id

}


