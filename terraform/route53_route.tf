resource "aws_route53_record" "application_cname" {
  zone_id = "${aws_route53_zone.application_zone.zone_id}"
  name    = "${var.application_url}"
  type    = "CNAME"
  ttl     = "60"
  records = ["${aws_instance.application.public_dns}"]
}
