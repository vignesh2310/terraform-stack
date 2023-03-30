resource "aws_vpc" "infra_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = "devops_vpc"
  }
}

resource "aws_subnet" "infra_pub1" {
  vpc_id     = aws_vpc.infra_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = var.ZONE1
  map_public_ip_on_launch = "true"

  tags = {
    Name = "devops_pub1"
  }
}

resource "aws_subnet" "infra_pub2" {
  vpc_id     = aws_vpc.infra_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = var.ZONE2
  map_public_ip_on_launch = "true"

  tags = {
    Name = "devops_pub2"
  }
}

resource "aws_subnet" "infra_pub3" {
  vpc_id     = aws_vpc.infra_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = var.ZONE3
  map_public_ip_on_launch = "true"

  tags = {
    Name = "devops_pub3"
  }
}

resource "aws_subnet" "infra_pvt1" {
  vpc_id     = aws_vpc.infra_vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = var.ZONE1
  map_public_ip_on_launch = "true"

  tags = {
    Name = "devops_pvt1"
  }
}

resource "aws_subnet" "infra_pvt2" {
  vpc_id     = aws_vpc.infra_vpc.id
  cidr_block = "10.0.5.0/24"
  availability_zone = var.ZONE2
  map_public_ip_on_launch = "true"

  tags = {
    Name = "devops_pvt2"
  }
}

resource "aws_subnet" "infra_pvt3" {
  vpc_id     = aws_vpc.infra_vpc.id
  cidr_block = "10.0.6.0/24"
  availability_zone = var.ZONE3
  map_public_ip_on_launch = "true"

  tags = {
    Name = "devops_pvt3"
  }
}

resource "aws_internet_gateway" "infra_igw" {
  vpc_id = aws_vpc.infra_vpc.id

  tags = {
    Name = "devops_igw"
  }
}

resource "aws_route_table" "infra_pub_rt" {
  vpc_id = aws_vpc.infra_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.infra_igw.id
  }

  tags = {
    Name = "devops_pubRT"
  }
}

resource "aws_route_table_association" "infra_pub1_rta" {
  subnet_id      = aws_subnet.infra_pub1.id
  route_table_id = aws_route_table.infra_pub_rt.id
}

resource "aws_route_table_association" "infra_pub2_rta" {
  subnet_id      = aws_subnet.infra_pub2.id
  route_table_id = aws_route_table.infra_pub_rt.id
}

resource "aws_route_table_association" "infra_pub3_rta" {
  subnet_id      = aws_subnet.infra_pub3.id
  route_table_id = aws_route_table.infra_pub_rt.id
}

