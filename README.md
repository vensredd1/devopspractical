# DevOps Practical Setup

This document provides a step-by-step guide to set up your development environment, including installing AWS CLI, Terraform, Docker, kubectl, Helm, and other necessary tools. It also covers running Docker containers and deploying infrastructure with Terraform.

## Prerequisites

Ensure you have the following installed on your system:
- curl
- unzip
- Docker
- Docker Compose
- AWS CLI
- Terraform
- kubectl
- Helm

## Installation Steps

### 1. Install AWS CLI, Terraform, Docker, Docker Compose, kubectl, and Helm

```bash
# Install AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install unzip
unzip awscliv2.zip
sudo ./aws/install

# Install Terraform
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt-get install terraform

# Install Docker and Docker Compose
sudo apt-get update && sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose

# Install kubectl
curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.29.3/2024-04-19/bin/linux/amd64/kubectl
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH

# Install Helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh


# Configure AWS CLI
aws configure

# Build and push your Docker image
sudo docker build -t svenna/poc:latest .
sudo docker push svenna/poc:latest
sudo docker login -u svenna
sudo docker push svenna/poc:latest

# Run Docker Compose
docker compose up

# Navigate to your Terraform configuration directory and run the following commands
terraform init
terraform plan
terraform apply

# Configure kubectl to use your EKS cluster
aws eks update-kubeconfig --name venna-dev-eks

# Create a new Helm chart and install it
helm create devopspractical
cd devopspractical
helm install devopspractical .

