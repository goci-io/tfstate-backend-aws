mkfile_dir := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

export TF_STATE_KEY ?= tfstate-backend/terraform.tfstate

## Initialize the terraform state backend
init:
	@aws s3 ls s3://${TF_BUCKET}/tfstate-backend/terraform.tfstate || \
		$(mkfile_dir)/scripts/init.sh $(TF_STATE_KEY)

## Clean up the project
clean:
	rm -rf .terraform *.tfstate*

## Pass arguments through to terraform which require remote state
apply console destroy graph plan output providers show: init
	terraform $@

## Pass arguments through to terraform which do not require remote state
get fmt validate version:
	terraform $@
