resource "aws_s3_bucket" "website" {
  bucket  = "www.${aws_route53_record.stack-nameserver.fqdn}"
  acl     = "public-read"
  tags {
    Name        = "www.${aws_route53_record.stack-nameserver.fqdn}" // Bucket name must be fqdn of hosted domain
    Environment = "${var.environment}"
    Stack       = "${var.stack_name}"
  }

  policy  = "${data.template_file.s3_public_policy.rendered}"

  website {
    index_document = "index.html"
  }
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
  type    = "A"
  alias {
    evaluate_target_health = false
    name = "${aws_s3_bucket.website.website_domain}"
    zone_id = "${aws_s3_bucket.website.hosted_zone_id}"
  }
}

data "template_file" "s3_public_policy" {
  template = "${file("${path.module}/policies/website_bucket.json")}"
  vars {
    bucket_name = "www.${aws_route53_record.stack-nameserver.fqdn}"
  }
}
