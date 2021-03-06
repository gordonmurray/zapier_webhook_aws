# Variables used
variable "aws_account_id" {
  // read from terraform.tfvars
  type = string
}

variable "default_instance_type" {
  // read from terraform.tfvars
  type = string
}

variable "default_region" {
  // read from terraform.tfvars
  type = string
}

variable "apply_immediately" {
  // read from terraform.tfvars
  type    = string
  default = "false"
}

variable "encryption_at_rest" {
  // read from terraform.tfvars
  type    = string
  default = "true"
}

variable "application_name" {
  type = string
}

variable "application_url" {
  type = string
}

variable "public_key" {
  type = string
}

variable "application_aws_key" {
  type = string
}
variable "application_aws_secret" {
  type = string
}

variable "application_aws_region" {
  type = string
}

variable "s3_bucket" {
  type = string
  default = "zapier-webhook-logs-bucket"
}