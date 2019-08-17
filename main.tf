terraform {
  required_version = ">= 0.11.2"
  backend "s3" {}
}

module "tfstate_backend" {
  source        = "git::https://github.com/cloudposse/terraform-aws-tfstate-backend.git?ref=tags/0.9.0"
  namespace     = var.namespace
  name          = var.name
  attributes    = var.attributes
  tags          = var.tags
  region        = var.aws_region
  force_destroy = var.force_destroy
  stage         = var.stage
  profile       = var.aws_profile
}
