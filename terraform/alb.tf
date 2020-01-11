resource "aws_lb" "loadbalancer" {
  name               = "application-loadbalancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.application.id]
  subnets            = [aws_subnet.subnet-1a.id, aws_subnet.subnet-1b.id]
  region             = var.default_region

  enable_deletion_protection = true

  access_logs {
    bucket  = "aws_s3_bucket.zapier_webhook_loadbalancer_logs.bucket"
    prefix  = ""
    enabled = true
  }

  tags = {
    Name = var.application_name
  }

  depends_on = [aws_s3_bucket.zapier_webhook_loadbalancer_logs]
}

resource "aws_lb_target_group" "application_targetgroup" {
  name     = "application-targetgroup"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.application.id
}
