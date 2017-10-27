output "website_bucket_url" {
  value = "${aws_s3_bucket.website.bucket}.s3-website-${var.region}.amazonaws.com"
}

output "base_env_zone_id" {
  value = "${data.aws_route53_zone.base-env-zone.id}"
}

output "base_fqdn" {
  value = "${module.environment.base_fqdn}."
}
