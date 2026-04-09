#!/bin/bash
################################
# Author : Ashutosh Shukla
# Date : 06 April
# Version : v2
# This Script reports back the usage of AWS Resources usage.
################################
set -x  # debug mode
# set -e  # exit on error

# Output file - saves in current user's home directory
REPORT="$(dirname "$0")/aws_report_$(date +%Y-%m-%d).txt" # This saves the report file right next to where this script lives 

echo "========= AWS Resource Report - $(date) ========" > "$REPORT"

# List S3 buckets
echo "" >> "$REPORT"
echo "+++++++ S3 Buckets +++++++" >> "$REPORT"
aws s3 ls >> "$REPORT"

# List EC2 Instances
echo "" >> "$REPORT"
echo "++++++ EC2 Instances in ap-southeast-2 region ++++++" >> "$REPORT"
aws ec2 describe-instances --region ap-southeast-2 \
  | jq -r '.Reservations[].Instances[] | "\(.InstanceId) \(.Tags[]|select(.Key=="Name").Value)"' >> "$REPORT" # Handles json output well

# List Lambda functions
echo "" >> "$REPORT"
echo "++++++ Lambda Functions ++++++" >> "$REPORT"
aws lambda list-functions --region ap-southeast-2 >> "$REPORT"   # User have not the listed permission in the policy , so this might fail.

# List IAM Users
echo "" >> "$REPORT"
echo "+++++++ IAM Users ++++++++" >> "$REPORT"
aws iam list-users >> "$REPORT"

echo "========= Report Complete ========" >> "$REPORT"
echo "✅ Report saved to $REPORT"
