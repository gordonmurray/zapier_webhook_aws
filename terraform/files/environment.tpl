#!/bin/bash
echo "AWS_KEY=\""${application_aws_key}\""" > /var/www/.env
echo "AWS_SECRET=\""${application_aws_secret}\""" >> /var/www/.env
echo "AWS_REGION=\""${application_aws_region}\""" >> /var/www/.env
echo "S3_BUCKET=\""${s3_bucket}\""" >> /var/www/.env