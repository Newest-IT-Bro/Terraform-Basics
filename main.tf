provider "aws" {
  region = "eu-west-2"
}

resource "aws_vpc" "example-vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "example-subnet" {
  vpc_id            = aws_vpc.example-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-west-2a"
}

data "aws_vpc" "active_vpc" {
  default = true
}


resource "aws_subnet" "active-subnet" {
  vpc_id            = data.aws_vpc.active_vpc.id
  cidr_block        = "172.31.11.0/24"
  availability_zone = "eu-west-2a"
}

