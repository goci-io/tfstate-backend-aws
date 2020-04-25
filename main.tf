terraform {
  required_version = ">= 0.11.2"
  backend "s3" {}

  required_providers {
    aws = "~> 2.50"
  }
}

module "label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.16.0"
  namespace  = var.namespace
  name       = var.name
  attributes = var.attributes
  tags       = var.tags
  stage      = var.stage
}

module "tfstate_backend" {
  source        = "git::https://github.com/cloudposse/terraform-aws-tfstate-backend.git?ref=tags/0.16.0"
  namespace     = var.namespace
  name          = var.name
  tags          = var.tags
  stage         = var.stage
  context       = module.label.context
  force_destroy = var.force_destroy
  region        = var.aws_region
  profile       = var.aws_profile
}
