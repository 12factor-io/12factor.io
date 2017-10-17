resource "aws_s3_bucket" "website" {
  bucket  = "${module.environment.website_bucket_name}"
  acl     = "public-read"
  tags {
    Name        = "${module.environment.website_bucket_name}"
    Environment = "${var.environment}"
    Stack       = "${var.stack_name}"
  }

  policy  = "${data.template_file.s3_public_policy.rendered}"
}

data "aws_route53_zone" "base-env-zone" {
  name = "${module.environment.base_fqdn}."
}

resource "aws_route53_zone" "stack-zone" {
  name    = "${module.environment.stack_fqdn}"
}

resource "aws_route53_record" "stack-nameserver" {
  zone_id = "${data.aws_route53_zone.base-env-zone.id}"
  name    = "${module.environment.stack_fqdn}"
  type    = "NS"
  ttl     = "30"

  records = [
    "${aws_route53_zone.stack-zone.name_servers.0}",
    "${aws_route53_zone.stack-zone.name_servers.1}",
    "${aws_route53_zone.stack-zone.name_servers.2}",
    "${aws_route53_zone.stack-zone.name_servers.3}",
  ]
}

resource "aws_route53_record" "www" {
  zone_id = "${aws_route53_zone.stack-zone.id}"
  name    = "www"
  type    = "CNAME"
  records = ["${aws_s3_bucket.website.bucket}.s3-website-${var.region}.amazonaws.com"]
}

data "template_file" "s3_public_policy" {
  template = "${file("${path.module}/policies/website_bucket.json")}"
  vars {
    bucket_name = "${module.environment.website_bucket_name}"
  }
}
