variable "environment" {
  type        = "string"
  description = "environment type i.e..: test, production. Mainly used for sizing instances etc.."
}

variable "stack_name" {
  type        = "string"
  description = "name of the stack, allows multiple instances per environment"
}

variable "default_base_fqdn" {
  type = "map"
  default = {
    development = "aws.dev.12factor.io",
    test    = "aws.test.12factor.io",
    production  = "aws.prod.12factor.io"
  }
}
