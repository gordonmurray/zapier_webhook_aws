resource "aws_subnet" "subnet-1a" {
  vpc_id                  = aws_vpc.application.id
  availability_zone       = "eu-west-1a"
  cidr_block              = "10.0.16.0/20"
  ipv6_cidr_block         = ""
  map_public_ip_on_launch = "true"

  tags = {
    Name = var.application_name
  }
}

resource "aws_subnet" "subnet-1b" {
  vpc_id = aws_vpc.application.id

  availability_zone       = "eu-west-1b"
  cidr_block              = "10.0.32.0/20"
  ipv6_cidr_block         = ""
  map_public_ip_on_launch = "true"

  tags = {
    Name = var.application_name
  }
}

