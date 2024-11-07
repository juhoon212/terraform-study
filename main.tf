terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.48"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

//create vpc
resource "aws_vpc" "default" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.default.id
  cidr_block = "10.0.0.0/24"
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.default.id
  cidr_block = "10.0.1.0/24"
}