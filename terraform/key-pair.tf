resource "aws_key_pair" "pem-key" {
  key_name   = var.application_name
  public_key = var.public_key
}

