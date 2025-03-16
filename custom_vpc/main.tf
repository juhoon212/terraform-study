

# Create a VPC
resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "my-vpc"
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "my-vpc_public_subnet_1"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "10.0.10.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "my-vpc_private_subnet_1"
  }
}

# internet_gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my-vpc.id
}

# nat_gateway
resource "aws_nat_gateway" "private_nat" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.private_subnet_1.id
}
