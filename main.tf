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
    Name = "tf_study_vpc"
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.default.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "tf_study_public_subnet_1"
  }
}

/*resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.default.id
  cidr_block = "10.0.10.0/24"
  tags = {
    Name = "tf_study_private_subnet_1"
  }
}*/

// 코드로 관리하지 않을 데이터들은 data 키워드를 붙여서 aws web에 있는 데이터와 동기화 시킬 수 있다.
/*data "aws_subnet" "selected" {
  id = "subnet_id"
}*/