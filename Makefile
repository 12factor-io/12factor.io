.DEFAULT_GOAL := build

TERRAFORM_VERSION = 0.10.8
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
    OS = linux
    USR_LOCAL = "~/bin"
endif
ifeq ($(UNAME_S),Darwin)
    OS = darwin
	USR_LOCAL = "/usr/local/bin"
endif

UNAME_P := $(shell uname -m)
ifeq ($(UNAME_P),x86_64)
    PROCESSOR = amd64
endif
ifneq ($(filter %86,$(UNAME_P)),)
    PROCESSOR = 386
endif
ifneq ($(filter arm%,$(UNAME_P)),)
    PROCESSOR = arm
endif

build: install website terraform

website:
	$(MAKE) --print-directory  -C website

terraform:
	$(MAKE) --print-directory  -C terraform

install:
	@if [ ! -s /usr/local/bin/terraform ]; then \
		wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_${OS}_${PROCESSOR}.zip -O terraform.zip; \
		unzip -o terraform.zip -d ${USR_LOCAL}; \
		rm terraform.zip; \
	fi;
.PHONY: build website terraform install
