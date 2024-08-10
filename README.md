# Building a Production Ready EKS Infrastructure with Terraform and Deploying with GitHub Actions

## Introduction

This project demonstrates how to build a production-ready Amazon Elastic Kubernetes Service (EKS) infrastructure using Terraform and automate its deployment using GitHub Actions. The repository provides a complete Infrastructure as Code (IaC) solution that sets up an EKS cluster, deploys necessary resources, and integrates CI/CD pipelines for continuous deployment.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Pre-requisites](#pre-requisites)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [Terraform Configuration](#terraform-configuration)
- [GitHub Actions Workflow](#github-actions-workflow)
- [Deployment](#deployment)
- [Contributing](#contributing)
- [License](#license)

## Features

- **EKS Cluster Setup**: Automated provisioning of an EKS cluster using Terraform.
- **Infrastructure Management**: Management of VPC, subnets, security groups, and IAM roles for the EKS cluster.
- **CI/CD Pipeline**: GitHub Actions pipeline for deploying Terraform configurations, managing infrastructure changes, and deploying applications to the EKS cluster.
- **Environment Variables**: Secure management of AWS credentials and Terraform variables using GitHub Secrets.
- **Scalable and Production-Ready**: Configurations optimized for high availability and scalability in production environments.

## Pre-requisites

Before you begin, ensure you have the following installed:

- **Terraform** (v1.8.4 or later)
- **AWS CLI** (v2.0 or later)
- **kubectl** (compatible with your EKS version)
- **GitHub Account** with a repository set up for this project
- **AWS Account** with permissions to create EKS clusters and related resources

## Project Structure

```plaintext
├── .github/
│   └── workflows/
│       └── terraform.yml    # GitHub Actions workflow for CI/CD pipeline
├── eks/
│   ├── backend.tf            # Backend configuration file
│   ├── main.tf                 # Terraform main file
│   ├── variables.tf           # Terraform variables file
│   └── variables.tfvars     # Variables for Terraform execution
├── module/
│   ├── eks.tf            # Backend configuration file
│   ├── gather.tf                 # Terraform main file
│   ├── iam.tf              # Terraform variables file
│   └── variables.tfvars     # Variables for Terraform execution
│   └── vpc.tf              # Variables for Terraform execution
└── README.md                # Project README file
```

## Getting Started
Clone the Repository
Start by cloning the repository to your local machine:

```bash
git clone https://github.com/obusorezekiel/production-eks-with-terraform.git
cd production-eks-with-terraform
```

## Set Up AWS Credentials
Ensure your AWS credentials are set up in your environment:

```bash
aws configure
```

Alternatively, store your AWS credentials as GitHub Secrets (AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY).

## Initialize Terraform
Navigate to the eks/ directory and initialize Terraform:

```bash
cd eks
terraform init
```

## Terraform Configuration
Define Variables
Modify the variables.tfvars file to specify your desired configuration, such as the AWS region, cluster name, and VPC settings.

## Plan and Apply
To plan and apply the Terraform configuration, use the following commands:

```bash
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

This will create the necessary infrastructure for your EKS cluster.

## GitHub Actions Workflow
The GitHub Actions workflow (.github/workflows/terraform.yml) is designed to automate the deployment of your Terraform configurations.

## Workflow Features
### Terraform Initialization: 

Initializes Terraform in the pipeline.

- Terraform Plan and Apply: Executes the Terraform plan and apply commands based on user input (plan/apply/destroy).

- CI/CD Pipeline: Automatically triggered by a GitHub event (e.g., push, pull request) or manually through the GitHub Actions UI.

- Running the Workflow
    - Push Changes: Push any changes to the main branch to trigger the workflow.
    - Manual Trigger: Alternatively, you can manually trigger the workflow using the workflow_dispatch event.

Monitor the workflow progress in the "Actions" tab of your GitHub repository.

## Deployment
After the EKS infrastructure is provisioned, you can deploy your applications using kubectl or integrate further CI/CD pipelines for continuous application deployment.

## Example Deployment
```bash
kubectl apply -f path/to/your/deployment.yaml
```
Ensure your kubeconfig is correctly configured to interact with the EKS cluster.


## Contributing
We welcome contributions to this project. Please fork the repository and create a pull request with your changes. Ensure that you follow the established coding standards and include documentation for any new features.

## License
This project is licensed under the MIT License. See the LICENSE file for details.