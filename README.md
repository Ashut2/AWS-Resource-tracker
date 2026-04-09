# AWS-Resource-tracker
Its a Shell script integrated with cronjob to send a a report daily at 6pm to the manager of the resources usage.

## Sample Report Output

```
========= AWS Resource Report - Thu Apr 9 2026 ========

+++++++ S3 Buckets +++++++
2026-03-26 16:16:19 my-s3-bucket

++++++ EC2 Instances ++++++
i-0xxxxxxxxxxxxx   my-ec2-instance

++++++ Lambda Functions ++++++
my-lambda-function

+++++++ IAM Users ++++++++
{
    "Users": [
        {
            "UserName": "my-iam-user",
            "UserId": "XXXXXXXXXXXXXXXXXXXX",
            "Arn": "arn:aws:iam::XXXXXXXXXXXX:user/my-iam-user",
            "CreateDate": "2026-03-26"
        }
    ]
}
========= Report Complete ========
```
