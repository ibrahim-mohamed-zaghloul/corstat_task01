# Corstat Infrastructure Deployment

## Project Overview

This project provides a comprehensive infrastructure deployment solution using Terraform, Docker, and Ansible for setting up a server hosting two services and forwarding traffic based on requests sent to the server using Nginx with a robust network configuration on AWS.

## Components

### 1. Terraform Infrastructure
- Creates a VPC with public subnets
- Provisions an EC2 instance
- Configures security groups
- Utilizes Terraform Cloud for state management

#### Key Files
- `1-network.tf`: Defines VPC, subnets, internet gateway
- `2-terraform.tfvars`: Configuration variables
- `3-provider.tf`: Terraform and AWS provider configuration
- `4-server.tf`: EC2 instance and security group setup
- `5-variables.tf`: Variable definitions

### 2. Docker Configuration
- Deploys SonarQube with PostgreSQL
- Uses Docker Compose for service orchestration

#### Key Files
- `docker-compose.yml`: Defines SonarQube and PostgreSQL services
- `Dockerfile`: Custom SonarQube configuration
- `sonar.properties`: SonarQube configuration properties

### 3. Ansible Configuration
- Automates server setup
- Installs and configures Apache, Nginx, Docker
- Deploys Docker services

#### Key Files
- `playbook.yml`: Main Ansible playbook
- `ansible.cfg`: Ansible configuration
- `ports.conf`: Corstat (Apache server) port configuration
- `reverse-proxy.conf`: Nginx reverse proxy setup

### 4. GitHub Actions
- Automates infrastructure deployment
- Manages Terraform apply
- Runs Ansible configuration

## Prerequisites

- AWS Account
- Terraform Cloud Account
- GitHub Secrets Configured:
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`
  - `TF_API_TOKEN`
  - `PRIVATE_KEY` (SSH key for EC2 access)

## Deployment Workflow

1. Push to `main` branch triggers GitHub Actions
2. Terraform provisions AWS infrastructure
3. Ansible configures the server
4. Docker deploys SonarQube

## Access Points

- SonarQube: `http://[EC2_IP]/sonarqube`
- Application: `http://[EC2_IP]/corstat`

## Customization

Modify the following files to adapt to your environment:
- `terraform.tfvars`
- `ansible/inventory`
- `docker-compose.yml`
