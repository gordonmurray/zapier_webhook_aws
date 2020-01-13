resource "aws_s3_bucket" "zapier_webhook_logs" {
  bucket = "${var.application_name}-logs-bucket"
  acl    = "private"
  region = var.default_region

  tags = {
    Name = var.application_name
  }

  lifecycle_rule {

    enabled = true

    prefix = ""

    tags = {
      Name = var.application_name
    }

    transition {
      days          = 30
      storage_class = "ONEZONE_IA"
    }

    transition {
      days          = 60
      storage_class = "GLACIER"
    }

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
