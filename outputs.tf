output "tfstate_backend_s3_bucket_domain_name" {
  value = module.tfstate_backend.s3_bucket_domain_name
}

output "tfstate_backend_s3_bucket_id" {
  value = module.tfstate_backend.s3_bucket_id
}

output "tfstate_backend_s3_bucket_arn" {
  value = module.tfstate_backend.s3_bucket_arn
}

output "tfstate_backend_dynamodb_table_name" {
  value = module.tfstate_backend.dynamodb_table_name
}

output "tfstate_backend_dynamodb_table_id" {
  value = module.tfstate_backend.dynamodb_table_id
}

output "tfstate_backend_dynamodb_table_arn" {
  value = module.tfstate_backend.dynamodb_table_arn
}

output "tfstate_backend_access_policy_arn" {
  value = join("", aws_iam_policy.state_access.*.arn)
}

output "tfstate_backend_access_policy_json" {
  value = join("", data.aws_iam_policy_document.access.*.json)
}
