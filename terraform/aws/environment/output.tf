output "base_fqdn" {
  value = "${lookup(var.default_base_fqdn, var.environment)}"
}

output "stack_fqdn" {
  value = "${var.stack_name}.${lookup(var.default_base_fqdn, var.environment)}"
}
