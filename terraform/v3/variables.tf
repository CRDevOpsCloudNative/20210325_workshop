variable "region" {
    type = string
    default = "us-west-2"
}
variable "availability_zonea" {
    type = string
    default = "us-west-2a"
}
variable "availability_zoneb" {
    type = string
    default = "us-west-2b"
}
variable "global" {
    type = string
    default = "172.16.0.0/16"
}
variable "subneta" {
    type = string
    default = "172.16.10.0/24"
}

variable "private_ipsa" {
    type = string
    default = "172.16.10.100"
}

variable "subnetb" {
    type = string
    default = "172.16.11.0/24"
}

variable "private_ipsb" {
    type = string
    default = "172.16.11.100"
}

variable "ami" {
    type = string
    default = "ami-005e54dee72cc1d00"
}
variable "type" {
    type = string
    default = "t2.micro"
}