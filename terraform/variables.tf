variable "environment" {
  type        = "string"
  description = "environment type i.e..: test, production. Mainly used for sizing instances etc.."
}

variable "stack_name" {
  type        = "string"
  description = "name of the stack, allows multiple instances per environment"
}

variable "aws_region" {
  type        = "string"
  description = "region to create aws resources in."
}