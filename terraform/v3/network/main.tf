resource "aws_vpc" "my_vpc" {
  cidr_block = var.global

  tags = {
    Name = "tf-workshop"
  }
}

resource "aws_subnet" "subnet_a" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.subneta
  availability_zone = var.availability_zonea

  tags = {
    Name = "tf-workshop"
  }
}

resource "aws_subnet" "subnet_b" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.subnetb
  availability_zone = var.availability_zoneb

  tags = {
    Name = "tf-workshop"
  }
}

resource "aws_security_group" "aws_security_group" {
  name        = "aws_security_group"
  description = "aws_security_group"
  vpc_id      = aws_vpc.my_vpc.id

  tags = {
    Name = "tf-workshop"
  }
}

resource "aws_network_interface" "foo" {
  subnet_id   = aws_subnet.subnet_a.id
  private_ips = [var.private_ipsa]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_network_interface" "bar" {
  subnet_id   = aws_subnet.subnet_b.id
  private_ips = [var.private_ipsb]

  tags = {
    Name = "primary_network_interface"
  }
}

