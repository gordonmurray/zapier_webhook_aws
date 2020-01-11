resource "aws_lb" "loadbalancer" {
  name               = "application-loadbalancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.application.id]
  subnets            = [aws_subnet.subnet-1a.id, aws_subnet.subnet-1b.id]

  enable_deletion_protection = true

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

  tags = {
    Name = var.application_name
  }
}

resource "aws_lb_listener" "application" {
  load_balancer_arn = "${aws_lb.loadbalancer.arn}"
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
  certificate_arn   = "arn:aws:acm:eu-west-1:016230046494:certificate/1ae54795-35f8-4712-805b-ea9f692d180e"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.application_targetgroup.arn}"
  }
}