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
}