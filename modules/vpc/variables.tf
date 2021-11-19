variable "cidr" {
  type        = string
  description = "VPC cidr block. Example: 10.0.0.0/16"
}

variable "environment" {
  type        = string
  description = "The name of the environment"
}
