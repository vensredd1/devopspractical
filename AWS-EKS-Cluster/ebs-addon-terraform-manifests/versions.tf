# Terraform Settings Block
terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version = ">= 4.65"
      version = ">= 5.31"      
     }
  }
  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "venna-terraform-state"
    key    = "eks-statefiles/terraformebs.tfstate"
    region = "ap-south-1" 

    
  }     
}

# Terraform Provider Block
provider "aws" {
  region = var.aws_region
}