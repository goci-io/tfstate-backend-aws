
data "aws_iam_policy_document" "access" {
  count = var.create_iam_policy ? 1 : 0

  statement {
    effect    = "Allow"
    actions   = ["s3:PutObject", "s3:GetObject"]
    resources = [format("%s/*", module.tfstate_backend.s3_bucket_arn)]
  }

  statement {
    effect    = "Allow"
    actions   = ["s3:ListBucket"]
    resources = [module.tfstate_backend.s3_bucket_arn]
  }

  statement {
    effect    = "Allow"
    actions   = ["dynamodb:GetItem", "dynamodb:PutItem", "dynamodb:DeleteItem"]
    resources = [module.tfstate_backend.dynamodb_table_arn]
  }
}

resource "aws_iam_policy" "state_access" {
  count       = var.create_iam_policy ? 1 : 0
  name        = module.label.id
  policy      = join("", data.aws_iam_policy_document.access.*.json)
  description = "Grants access to State Bucket and Locking Table for backend ${module.tfstate_backend.s3_bucket_id}"
}

