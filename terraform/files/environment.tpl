#!/bin/bash
echo "AWS_KEY=\""${application_aws_key}\""" >> /home/ubuntu/.env
echo "AWS_SECRET=\""${application_aws_secret}\""" > /home/ubuntu/.env
echo "AWS_REGION=\""${application_aws_region}\""" > /home/ubuntu/.env
echo "S3_BUCKET=\""${s3_bucket}\""" > /home/ubuntu/.env