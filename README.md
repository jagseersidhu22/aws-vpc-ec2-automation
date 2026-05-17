# aws-vpc-ec2-automation
This project demonstrates a fully modular and reusable AWS infrastructure built using Terraform. It provisions a complete network and compute stack including VPC, Subnets, Internet Gateway, Route Tables, Security Groups, Network Interfaces, Elastic IP, and EC2 instances.

## 📌 Architecture Overview

The infrastructure is designed in a modular way:

- VPC (Virtual Private Cloud)
- Public Subnet
- Internet Gateway
- Route Table with Internet access
- Security Group (SSH + HTTP access)
- Network Interface (ENI)
- Elastic IP (Static Public IP)
- EC2 Instance (Amazon Linux)
