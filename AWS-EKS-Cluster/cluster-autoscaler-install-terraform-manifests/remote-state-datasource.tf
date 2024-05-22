# Terraform Remote State Datasource - Remote Backend AWS S3
data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket = "venna-terraform-state"
    key    = "eks-statefiles/terraform.tfstate"
    region = "ap-south-1"
  }
}