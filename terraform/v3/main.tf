terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  profile = "default"
}

module "net" {
  source = "./network"
  global = var.global

}

resource "aws_subnet" "subnet_a" {
  vpc_id            = modules.net.id
  cidr_block        = var.subneta
  availability_zone = var.availability_zonea

  tags = {
    Name = "tf-workshop"
  }
}
resource "aws_subnet" "subnet_b" {
  vpc_id            = modules.net.id
  cidr_block        = var.subnetb
  availability_zone = var.availability_zoneb

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

resource "aws_instance" "foo" {
  ami           = var.ami
  instance_type = var.type

  network_interface {
    network_interface_id = aws_network_interface.foo.id
    device_index         = 0
  }
  tags = {
    Name = "tf-workshopfoo"
  }
}

resource "aws_instance" "bar" {
  ami           = var.ami
  instance_type = var.type

  network_interface {
    network_interface_id = aws_network_interface.bar.id
    device_index         = 0
  }
  tags = {
    Name = "tf-workshopbar"
  }
}

resource "aws_security_group" "aws_security_group" {
  name        = "aws_security_group"
  description = "aws_security_group"
  vpc_id      = modules.net.id

  tags = {
    Name = "tf-workshop"
  }
}
