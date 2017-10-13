.DEFAULT_GOAL := build

.terraform:
	terraform get -update=true

build: s3dir plan
configure:
	go get github.com/saymedia/terraform-s3-dir
	go install github.com/saymedia/terraform-s3-dir

plan: .terraform
	terraform plan --out plan | tee -a commandoutput.log

apply:
	terraform apply plan | tee -a commandoutput.log

s3dir:
	go get github.com/saymedia/terraform-s3-dir
	go install github.com/saymedia/terraform-s3-dir
	terraform-s3-dir ../website/build/ '${module.environment.website_bucket_name}' > aws/middleman_files.tf
.PHONY: .terraform plan apply configure s3dir build
