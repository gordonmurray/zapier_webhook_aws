# route53 zones
resource "aws_route53_zone" "application_zone" {
  name = "ingress.gordonmurray.com"
}