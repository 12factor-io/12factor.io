.terraform:
	terraform get -update=true

configure:
	go get github.com/saymedia/terraform-s3-dir
	go install github.com/saymedia/terraform-s3-dir
	
plan: .terraform
	terraform plan --out plan | tee -a commandoutput.log

apply:
	terraform apply plan | tee -a commandoutput.log

.PHONY: .terraform plan apply configure