#!/bin/bash
# This script automates the cold-start process of provisioning the Terraform state backend using terraform
set -e

# Start from a clean slate
rm -rf .terraform terraform.tfstate

# Initialize terraform modules and providers
terraform init -backend=false

# Provision S3 bucket and dynamodb tables
terraform apply -auto-approve

export TF_BUCKET=$(terraform output tfstate_backend_s3_bucket_id)
export TF_DYNAMODB_TABLE=$(terraform output tfstate_backend_dynamodb_table_id)
export TF_BUCKET_REGION=${AWS_DEFAULT_REGION}

# Reinitialize terraform to import state to remote backend
terraform init \
  -force-copy \
  -backend="s3"
  -backend-config="encrypt=true" \
  -backend-config="bucket=${TF_BUCKET}" \
  -backend-config="key=tfstate-backend/terraform.tfstate"
