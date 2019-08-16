# tfstate-backend-aws

This module provides a wrapper around the existing [cloudposse/terraform-aws-tfstate-backend](https://github.com/cloudposse/terraform-aws-tfstate-backend).

It allows you to run this module in a pipeline by running `make init` for example to detect whether the remote state was already created or not.
In case the remote state was not created yet the resources are provisioned and the state imported into the new backend.