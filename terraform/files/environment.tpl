#!/bin/bash
echo export AWS_KEY="${application_aws_key}" >> /etc/profile
echo export AWS_SECRET="${application_aws_secret}" >> /etc/profile
echo export AWS_REGION="${application_aws_region}" >> /etc/profile
echo export S3_BUCKET="${s3_bucket}" >> /etc/profile