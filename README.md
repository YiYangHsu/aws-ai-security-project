AWS Secure AI API Project
Overview

This project is a hands-on cloud security and AI integration portfolio project built using AWS and Terraform.

The goal of the project is to simulate a real-world secure cloud API architecture using Infrastructure as Code (IaC), serverless technologies, security controls, monitoring, and secret management.

The project is being developed incrementally using a top-down learning approach:

Build real project → learn required concepts during implementation

Current architecture includes:

User
 ↓
CloudFront
 ↓
AWS WAF
 ↓
API Gateway
 ↓
AWS Lambda
 ↓
AWS Secrets Manager
 ↓
External API
 ↓
CloudWatch Logs + Monitoring
Architecture Diagram
                    ┌────────────────────┐
                    │       User         │
                    └─────────┬──────────┘
                              │
                              ▼
                    ┌────────────────────┐
                    │    CloudFront      │
                    └─────────┬──────────┘
                              │
                              ▼
                    ┌────────────────────┐
                    │      AWS WAF       │
                    │  Rate Limiting     │
                    └─────────┬──────────┘
                              │
                              ▼
                    ┌────────────────────┐
                    │   API Gateway      │
                    └─────────┬──────────┘
                              │
                              ▼
                    ┌────────────────────┐
                    │   AWS Lambda       │
                    │  Node.js Runtime   │
                    └─────────┬──────────┘
                              │
                ┌─────────────┴─────────────┐
                ▼                           ▼
      ┌──────────────────┐      ┌──────────────────┐
      │ Secrets Manager  │      │ CloudWatch Logs  │
      │ Secure API Keys  │      │ Monitoring       │
      └──────────────────┘      └──────────────────┘
                             
                              ▼
                    ┌────────────────────┐
                    │ External API Call  │
                    └────────────────────┘
Technologies Used
Cloud Services
Amazon Web Services Lambda
Amazon Web Services API Gateway
Amazon Web Services CloudFront
Amazon Web Services WAF
Amazon Web Services CloudWatch
Amazon Web Services Secrets Manager
Amazon Web Services IAM
Infrastructure as Code
HashiCorp Terraform
Programming
Node.js
JavaScript
Version Control
GitHub GitHub
Git
Features
Serverless API
Public HTTPS API endpoint
API Gateway to Lambda integration
Terraform-managed deployment
Secure Secret Management
Secrets stored in AWS Secrets Manager
No hardcoded credentials
Runtime secret retrieval
Security Controls
AWS WAF rate limiting
Least-privilege IAM permissions
No secrets committed to GitHub
Defense-in-depth architecture
Monitoring & Logging
CloudWatch logs
Lambda execution metrics
Error monitoring
Operational visibility
Infrastructure as Code
Fully managed using Terraform
Reproducible deployments
Version-controlled infrastructure
Security Concepts Demonstrated
Security Area	Implementation
Least Privilege IAM	Custom secret access policy
Secret Management	AWS Secrets Manager
API Protection	AWS WAF
Logging & Monitoring	CloudWatch
Infrastructure Security	Terraform IaC
Secure Credential Handling	Runtime secret retrieval
Defense in Depth	Multiple security layers
Terraform Deployment
Prerequisites

Install:

Terraform
AWS CLI
Node.js

Configure AWS credentials:

aws configure
Deploy Infrastructure

Go to Terraform directory:

cd terraform

Initialize Terraform:

terraform init

Deploy infrastructure:

terraform apply
Lambda Packaging

From project root:

Compress-Archive -Path lambda/* -DestinationPath lambda.zip -Force
API Testing

After deployment, test API endpoint:

https://YOUR_API_ENDPOINT/prod/hello

Or through CloudFront:

https://YOUR_CLOUDFRONT_DOMAIN/hello
Monitoring

CloudWatch logs:

/aws/lambda/ai-security-demo

Metrics monitored:

Invocations
Errors
Duration
Request activity
WAF Protection

Current protections:

Rate limiting
Basic request filtering
Edge protection using CloudFront

Example rule:

Block IPs sending excessive requests
Project Structure
aws-ai-security-project/
│
├── lambda/
│   ├── index.js
│   ├── package.json
│   └── package-lock.json
│
├── terraform/
│   ├── main.tf
│   ├── outputs.tf
│   └── variables.tf
│
├── architecture.drawio
├── README.md
└── .gitignore
Lessons Learned

This project helped develop practical experience with:

AWS serverless architecture
Terraform Infrastructure as Code
IAM and least privilege design
Cloud debugging and troubleshooting
Git hygiene and repository management
Cloud monitoring and observability
API security concepts
Secure secret management
Future Improvements

Planned future enhancements:

CI/CD pipeline using GitHub Actions
Custom IAM policies refinement
Real AI API integration
Structured JSON logging
Automated alerting with SNS
Security hardening review
Custom domain with ACM
Advanced WAF managed rules
Portfolio Objective

This project is designed to demonstrate practical skills relevant to:

Cloud Engineer
DevSecOps Engineer
Cloud Security Engineer
Platform Engineer
Security-focused System Administrator
Author

Built as a continuous hands-on cloud security learning project using:

AWS
Terraform
GitHub
Node.js