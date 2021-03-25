terraform {
  required_providers {}
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "tf-workshop"
  }
}

resource "aws_subnet" "subnet_a" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name = "tf-workshop"
  }
}

resource "aws_subnet" "subnet_b" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.11.0/24"
  availability_zone = "us-west-2b"

  tags = {
    Name = "tf-workshop"
  }
}

resource "aws_network_interface" "foo" {
  subnet_id   = aws_subnet.subnet_a.id
  private_ips = ["172.16.10.100"]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_network_interface" "bar" {
  subnet_id   = aws_subnet.subnet_b.id
  private_ips = ["172.16.11.100"]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "foo" {
  ami           = "ami-005e54dee72cc1d00" # us-west-2
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.foo.id
    device_index         = 0
  }
}

resource "aws_instance" "bar" {
  ami           = "ami-005e54dee72cc1d00" # us-west-2
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.bar.id
    device_index         = 0
  }
}