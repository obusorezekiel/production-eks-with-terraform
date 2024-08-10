terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.49.0"
    }
  }
  backend "s3" {
    bucket         = "ezekiel-terra-state"
    region         = "us-east-1"
    key            = "eks/terraform.tfstate"
    //dynamodb_table = "MyTable"
    encrypt        = true
  }
}

provider "aws" {
  region  = var.aws-region
}