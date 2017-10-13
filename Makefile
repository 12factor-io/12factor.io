.DEFAULT_GOAL := build terraform

build: website

website:
	$(MAKE) --print-directory  -C website

terraform:
	$(MAKE) --print-directory  -C terraform

.PHONY: build website terraform
