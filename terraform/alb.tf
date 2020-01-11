# Create a load balancer
resource "aws_lb" "loadbalancer" {
  name               = "application-loadbalancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.application.id]
  subnets            = [aws_subnet.subnet-1a.id, aws_subnet.subnet-1b.id]

  tags = {
    Name = var.application_name
  }

  depends_on = [aws_acm_certificate.gordonmurray]
}

# Create a target group
resource "aws_lb_target_group" "application_targetgroup" {
  name     = "application-targetgroup"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.application.id

  tags = {
    Name = var.application_name
  }
}

# Connect the LB to a Target group
resource "aws_lb_listener" "application" {
  load_balancer_arn = aws_lb.loadbalancer.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
  certificate_arn   = aws_acm_certificate.gordonmurray.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.application_targetgroup.arn
  }
}

# Attach the target group to an EC2 instance
resource "aws_lb_target_group_attachment" "target" {
  target_group_arn = aws_lb_target_group.application_targetgroup.arn
  target_id        = aws_instance.application.id
  port             = 80
}