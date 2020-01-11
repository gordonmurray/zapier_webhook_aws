resource "aws_acm_certificate" "gordonmurray" {
  domain_name               = "gordonmurray.com"
  validation_method         = "DNS"
  subject_alternative_names = ["www.gordonmurray.com"]

  tags = {
    Name = var.application_name
  }

  lifecycle {
    create_before_destroy = true
  }
}
