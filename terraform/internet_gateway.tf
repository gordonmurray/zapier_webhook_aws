resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.application.id

  tags = {
    Name = var.application_name
  }
}

