resource "aws_s3_bucket" "web" {
  bucket  = "${module.environment.website_bucket_name}"
  acl     = "public-read"
  tags {
    Name        = "${module.environment.website_bucket_name}"
    Environment = "${var.environment}"
    Stack       = "${var.stack_name}"
  }

  policy  = "${data.template_file.s3_public_policy.rendered}"
}

data "template_file" "s3_public_policy" {
  template = "${file("policies/website_bucket.json")}"
  vars {
    bucket_name = "${module.environment.website_bucket_name}"
  }
}