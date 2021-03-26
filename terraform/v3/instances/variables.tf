variable "ami" {
    type = string
    default = "ami-005e54dee72cc1d00"
}
variable "type" {
    type = string
    default = "t2.micro"
}

variable "aws_network_interface_foo" {
    type = string
}

variable "aws_network_interface_bar" {
    type = string
}
