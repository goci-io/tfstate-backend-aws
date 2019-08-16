variable "namespace" {
  type        = string
  description = "Namespace (e.g. `cp` or `cloudposse`)"
}

variable "stage" {
  type        = string
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
}

variable "name" {
  type        = string
  description = "Application or solution name (e.g. `app`)"
  default     = "terraform"
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `namespace`, `stage`, `name` and `attributes`"
}

variable "attributes" {
  type        = list(string)
  default     = ["state"]
  description = "Additional attributes (e.g. `1`)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)"
}

variable "aws_region" {
  type        = string
  description = "AWS Region the S3 bucket should reside in"
  default     = "eu-central-1"
}

variable "force_destroy" {
  type        = string
  description = "A boolean that indicates the S3 bucket can be destroyed even if it contains objects. These objects are not recoverable."
  default     = "false"
}

variable "aws_profile" {
  default     = ""
  description = "AWS profile name as set in the shared credentials file"
}

