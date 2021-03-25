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
  region  = var.region
}

module "network" {
  source = "./network"
}

module "instances" {
  # depends_on = [
  #    module.network
  # ]
  source = "./instances"
  aws_network_interface_foo = module.network.aws_network_interface_foo
  aws_network_interface_bar = module.network.aws_network_interface_bar
}