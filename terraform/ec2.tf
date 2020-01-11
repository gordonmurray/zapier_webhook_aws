# Get AMI
data "aws_ami" "application_ami" {
  most_recent = true

  filter {
    name = "name"

    values = [var.application_name]
  }

  owners = [var.aws_account_id]
}

# Create EC2 instances
resource "aws_instance" "application" {
  ami                    = data.aws_ami.application_ami.id
  instance_type          = var.default_instance_type
  vpc_security_group_ids = [aws_security_group.application.id]
  subnet_id              = aws_subnet.subnet-1a.id
  key_name               = aws_key_pair.pem-key.key_name

  user_data = <<EOF
#!/bin/bash -v
sudo certbot certonly --nginx -d zapier.ingress.gordonmurray.com --agree-tos -m gordon@gordonmurray.com -n > /home/ubuntu/certbot.log
sudo ln -s /etc/nginx/sites-available/zapier.ingress.gordonmurray.com /etc/nginx/sites-enabled/
sudo rm -f /etc/nginx/sites-enabled/default
sudo nginx -s reload
EOF

  tags = {
    Name = var.application_name
  }
}