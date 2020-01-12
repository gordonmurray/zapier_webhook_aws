#!/bin/bash
echo "AWS_KEY=\""${application_aws_key}\""" | sudo tee /var/www/.env > /dev/null
echo "AWS_SECRET=\""${application_aws_secret}\""" | sudo tee -a /var/www/.env > /dev/null
echo "AWS_REGION=\""${application_aws_region}\""" | sudo tee -a /var/www/.env > /dev/null
echo "S3_BUCKET=\""${s3_bucket}\""" | sudo tee -a /var/www/.env > /dev/null