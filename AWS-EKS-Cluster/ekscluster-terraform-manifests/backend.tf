terraform {
  backend "s3" {
    bucket         = "venna-terraform-state"  # Update with your S3 bucket name
    key            = "eks-statefiles/terraform.tfstate"  # Update with your desired state file name/path within the folder
    region         = "ap-south-1"  # Update with your desired AWS region
    }
}
