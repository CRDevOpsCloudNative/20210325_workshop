resource "aws_instance" "foo" {
  ami           = var.ami
  instance_type = var.type

  network_interface {
    network_interface_id = var.aws_network_interface_foo
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
    network_interface_id = var.aws_network_interface_bar
    device_index         = 0
  }
  tags = {
    Name = "tf-workshopbar"
  }
}
