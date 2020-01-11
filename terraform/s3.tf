resource "aws_s3_bucket" "zapier_webhook_logs" {
  bucket = "${var.application_name}-logs-bucket"
  acl    = "private"
  region = var.default_region

  tags = {
    Name = var.application_name
  }
}

resource "aws_s3_bucket" "zapier_webhook_loadbalancer_logs" {
  bucket = "${var.application_name}-loadbalancer-logs-bucket"
  acl    = "private"
  region = var.default_region

  tags = {
    Name = var.application_name
  }
}
