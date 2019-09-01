mkfile_dir := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

export TF_STATE_KEY ?= tfstate-backend/terraform.tfstate

init:
	@aws s3 ls s3://${TF_BUCKET}/$(TF_STATE_KEY) && \
		terraform init -backend-config="key=$(TF_STATE_KEY)" || \
		$(mkfile_dir)/scripts/init.sh $(TF_STATE_KEY)

clean:
	rm -rf .terraform *.tfstate*

apply console destroy graph plan output providers show: init
	terraform $@

get fmt validate version:
	terraform $@
