output "public_dns" {
  description = "The EC2 instance DNS"
  value       = "${aws_instance.application.public_dns}"
}