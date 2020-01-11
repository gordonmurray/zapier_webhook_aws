resource "aws_security_group" "application" {
  name        = var.application_name
  description = "${var.application_name} security group"
  vpc_id      = aws_vpc.application.id

  tags = {
    Name = var.application_name
  }
}

