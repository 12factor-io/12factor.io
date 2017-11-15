#!/usr/bin/env bash
set -ex
TERRAFORM_VERSION=0.10.8
OS=linux
PROCESSOR=amd64

wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_${OS}_${PROCESSOR}.zip -O terraform.zip
sudo unzip -p terraform.zip terraform >/usr/local/bin/terraform
sudo chmod +x /usr/local/bin/terraform
rm terraform.zip
