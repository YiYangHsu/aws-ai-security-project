# AWS Secure AI API Project

## Goal

Build a secure AI API using:
- AWS Lambda
- API Gateway
- Terraform
- CloudWatch
- IAM security

The purpose of this project is to practice cloud engineering, security engineering, and Infrastructure as Code (IaC).

---

## Current Architecture

User → API Gateway → Lambda → External AI API → CloudWatch

(Currently API Gateway and external AI API are planned for future weeks.)

---

## Current AWS Architecture

Terraform → IAM Role → AWS Lambda → CloudWatch Logs

---

## Technologies

- AWS Lambda
- AWS IAM
- Terraform
- Node.js
- GitHub
- CloudWatch

---

## Week 1

- Learned project architecture
- Setup local environment
- Installed Node.js
- Created GitHub repository
- Created first README

---

## Week 2

- Learned Git basics
- Learned GitHub workflow
- Setup Terraform
- Configured AWS CLI
- Created Terraform project structure
- Learned .gitignore and repository cleanup

---

## Week 3

- Created AWS Lambda function
- Created IAM role using Terraform
- Attached AWS managed policy for CloudWatch logging
- Deployed Lambda using Terraform
- Learned Lambda packaging and ZIP deployment
- Debugged Lambda UTF-8 encoding issue
- Tested Lambda successfully in AWS Console

---

## Security Concepts Learned

- IAM role trust policy
- AWS managed policies
- CloudWatch logging permissions
- Infrastructure as Code (IaC)
- Avoiding hardcoded credentials
- Git repository hygiene

---

## Future Improvements

Planned future work:
- API Gateway integration
- External AI API integration
- AWS Secrets Manager
- WAF protection
- CloudWatch alarms
- CI/CD pipeline
- Custom least-privilege IAM policy

---

## Author

Created by Yi-Yang Hsu as a cloud security engineering learning project.