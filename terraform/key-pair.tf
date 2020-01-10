resource "aws_key_pair" "pem-key" {
  key_name   = "${var.application_name}"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}