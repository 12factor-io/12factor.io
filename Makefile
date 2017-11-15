.DEFAULT_GOAL := build

build: website terraform

website:
	$(MAKE) --print-directory  -C website

terraform:
	$(MAKE) --print-directory  -C terraform

.PHONY: build website terraform
