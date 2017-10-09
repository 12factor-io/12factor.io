module "aws" {
	source	    = "aws"
	region	    = "${var.aws_region}"
  stack_name  = "${var.stack_name}"
  environment = "${var.environment}"
}