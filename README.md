# Terraform AWS 3-Tier Architecture (Enterprise Modular Design)

This project provisions a highly available 3-tier architecture on AWS using modular Terraform design.

## Architecture Components

- VPC with Public & Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables
- Application Load Balancer
- Auto Scaling Group
- EC2 Web Tier
- RDS MySQL Database Tier
- Remote S3 Backend State

## Deployment

terraform init
terraform plan
terraform apply -var-file="terraform.tfvars"

## Environment Separation

Supports:
- dev
- stage
- prod

## Remote State Management

- S3 Backend
- DynamoDB State Locking

## Security Best Practices

- No hardcoded secrets
- IAM Role-based access
- Private RDS subnet
- Multi-AZ support


## 📂 Project Structure

terraform-aws-3tier-architecture/
│
├── versions.tf
├── provider.tf
├── backend.tf
├── variables.tf
├── terraform.tfvars
├── main.tf
├── outputs.tf
│
└── modules/
    ├── vpc/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    │
    ├── security-groups/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    │
    ├── ec2/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    │
    ├── alb/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    │
    └── rds/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
