# Get AMI
data "aws_ami" "application_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.application_name]
  }

  owners = [var.aws_account_id]
}

# Prepare user_data via a template file and environment variables
data "template_file" "user_data" {
  template = "${file("files/environment.tpl")}"
  vars = {
    application_aws_key    = var.application_aws_key
    application_aws_secret = var.application_aws_secret
    application_aws_region = var.application_aws_region
    s3_bucket              = aws_s3_bucket.zapier_webhook_logs.id
  }
}

# Create EC2 instances
resource "aws_instance" "application" {
  ami                    = data.aws_ami.application_ami.id
  instance_type          = var.default_instance_type
  vpc_security_group_ids = [aws_security_group.application.id]
  subnet_id              = aws_subnet.subnet-1a.id
  key_name               = aws_key_pair.pem-key.key_name
  user_data              = data.template_file.user_data.rendered

  tags = {
    Name = var.application_name
  }
}
