.DEFAULT_GOAL := travis-build

.terraform:
	terraform get -update=true

build: tfvars s3dir plan apply

travis-build: build destroy

destroy:
	terraform destroy --force | tee -a commandoutput.log

tfvars:
	scripts/pre-build.sh

configure:
	go version
	go get github.com/saymedia/terraform-s3-dir
	go install github.com/saymedia/terraform-s3-dir

plan: .terraform
	terraform plan --out plan | tee -a commandoutput.log

apply:
	terraform apply plan | tee -a commandoutput.log

s3dir:
	go get github.com/saymedia/terraform-s3-dir
	go install github.com/saymedia/terraform-s3-dir
	terraform-s3-dir ../website/build/ '$${aws_s3_bucket.website.bucket}' > aws/middleman_files.tf
.PHONY: .terraform plan apply configure s3dir build tfvars travis-build destroy
