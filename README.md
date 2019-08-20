# tfstate-backend-aws

#### Maintained by [@goci-io/prp-terraform](https://github.com/orgs/goci-io/teams/prp-terraform)

This module provides a wrapper around the existing [cloudposse/terraform-aws-tfstate-backend](https://github.com/cloudposse/terraform-aws-tfstate-backend).

It allows you to run this module in a pipeline by running `make init` for example to detect whether the remote state was already created or not.
In case the remote state was not created yet the resources are provisioned and the state imported into the new backend.

### Usage
You will need a global `TF_BUCKET` environment variable set. From this variable we source the target bucket name.

To use this project run `make init`

#### Verify

To verify it all worked, run `aws s3 ls s3://${TF_BUCKET}/tfstate-backend/terraform.tfstate` it should display the `terraform.tfstate` file and date when it was created.
