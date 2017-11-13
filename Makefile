.DEFAULT_GOAL := build

TERRAFORM_VERSION = 0.10.8
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
    OS = linux
endif
ifeq ($(UNAME_S),Darwin)
    OS = darwin
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
	@echo ${PATH}
	@echo ${GOPATH}
	ls /usr/local/bin
	which go
	go version
	@if [ ! -s /usr/local/bin/terraform ]; then \
		wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_${OS}_${PROCESSOR}.zip -O terraform.zip; \
		unzip -p terraform.zip terraform >/usr/local/bin/terraform; \
		chmod +x /usr/local/bin/terraform; \
		rm terraform.zip; \
	fi;
.PHONY: build website terraform install
