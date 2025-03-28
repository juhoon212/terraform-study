terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-northeast-2"
}

# module 추가 시 terraform init 을 항상 실행해야함.
module "default_custom_vpc" {
  source = "./custom_vpc"
}
