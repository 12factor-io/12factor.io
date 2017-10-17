output "website_bucket_name" {
  value = "12factor_io_${var.stack_name}"
}

output "base_fqdn" {
  value = "${lookup(var.default_base_fqdn, var.environment)}"
}
