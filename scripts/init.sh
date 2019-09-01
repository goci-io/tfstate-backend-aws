#!/bin/bash
# This script automates the cold-start process of provisioning the Terraform state backend using terraform
set -e

# Start from a clean slate
rm -rf .terraform terraform.tfstate

sed -Ei 's/^(\s+backend\s+)/#\1/' main.tf

# Initialize terraform modules and providers
TF_CLI_ARGS_init='' terraform init

# Provision S3 bucket and dynamodb tables
TF_CLI_ARGS_apply='' terraform apply -auto-approve

export TF_BUCKET=$(terraform output tfstate_backend_s3_bucket_id)
export TF_DYNAMODB_TABLE=$(terraform output tfstate_backend_dynamodb_table_id)
export TF_BUCKET_REGION=${AWS_REGION}

sed -Ei 's/^#(\s+backend\s+)/\1/' main.tf

# Reinitialize terraform to import state to remote backend
TF_CLI_ARGS_init='' terraform init \
  -force-copy \
  -backend-config=encrypt=true \
  -backend-config=bucket=${TF_BUCKET} \
  -backend-config=key=${1}
