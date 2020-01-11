resource "aws_acm_certificate" "gordonmurray" {
  domain_name               = "ingress.gordonmurray.com"
  validation_method         = "DNS"
  subject_alternative_names = ["*.ingress.gordonmurray.com"]

  tags = {
    Name = var.application_name
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "cert_validation" {
  name    = "${aws_acm_certificate.gordonmurray.domain_validation_options.0.resource_record_name}"
  type    = "${aws_acm_certificate.gordonmurray.domain_validation_options.0.resource_record_type}"
  zone_id = "${aws_route53_zone.application_zone.id}"
  records = ["${aws_acm_certificate.gordonmurray.domain_validation_options.0.resource_record_value}"]
  ttl     = 60
}

resource "aws_acm_certificate_validation" "cert" {
  certificate_arn         = "${aws_acm_certificate.gordonmurray.arn}"
  validation_record_fqdns = ["${aws_route53_record.cert_validation.fqdn}"]
}
