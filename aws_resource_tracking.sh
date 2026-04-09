#!/bin/bash

################################

# Author : Ashutosh Shukla
# Date : 06 April

# Version : v1

# This Script reports back the usage of AWS Resources usage.

################################

# Resource this script going to track : EC2 , S3 , Lambda Function , IAM 

set -x # debug mode

set -e # to show error


# Output file - creates automatically if it doesn't exist

REPORT="/home/ubuntu/aws_report_$(date +%Y-%m-%d).txt"
echo "========= AWS Resource Report - $(date) ======== " >> "$REPORT"

# List S3 buckets
echo "+++++++ s3 Buckets ++++++" >> "$REPORT"

aws s3 ls

# Note: For any reference of AWS CLI command , We can refer to AWS CLI command Documentation.

# List EC2 Instances
echo "++++++ ec2 Instances in ap-southeast-2 region ++++++" >> "$REPORT"

aws ec2 describe-instances --region ap-southeast-2 | jq -r '.Reservations[].Instances[] | "\(.InstanceId) \(.Tags[]|select(.Key=="Name").Value)"' # InstanceID Name-of-instance

# check your instance region and replace it ^ 

# List Lambda functions 
echo "++++++ Lambda functions +++++++" >> "$REPORT"

aws lambda list-functions

# List IAM Users
echo "+++++++ IAM Users ++++++++" >> "$REPORT"

aws iam list-users

echo "Report saved to $REPORT file" 
