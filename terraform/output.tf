output "aws_website_url" {
  value = "${module.aws.website_url}"
}

output "aws_website_bucket_url" {
  value = "${module.aws.website_bucket_url}"
}

output "aws_base_env_zone_id" {
  value = "${module.aws.base_env_zone_id}"
}

output "aws_base_fqdn" {
  value = "${module.aws.base_fqdn}"
}
