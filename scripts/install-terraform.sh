#!/usr/bin/env bash
set -ex
TERRAFORM_VERSION=0.10.8
OS=linux
PROCESSOR=amd64

pushd /tmp
wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_${OS}_${PROCESSOR}.zip -O terraform.zip
unzip terraform.zip
mv ./terraform /usr/local/bin/
rm terraform.zip
popd
