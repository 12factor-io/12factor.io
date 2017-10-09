provider "aws" {
  region  = "${var.region}"
}

module "environment" {
  source      = "environment"
  stack_name  = "${var.stack_name}"
  environment = "${var.environment}"
}