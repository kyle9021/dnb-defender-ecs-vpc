variable "environment" {
  type        = string
  description = "The name of the environment"
}

variable "cluster" {
  type        = string
  default     = "pc-defender"
  description = "The name of the ECS cluster"
}

variable "instance_group" {
  type        = string
  default     = "default"
  description = "The name of the instances that you consider as a group"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC cidr block. Example: 10.0.0.0/16"
}

variable "private_subnet_cidrs" {
  type        = list
  description = "List of private cidrs, for every availability zone you want you need one. Example: 10.0.0.0/24 and 10.0.1.0/24"
}

variable "public_subnet_cidrs" {
  type        = list
  description = "List of public cidrs, for every availability zone you want you need one. Example: 10.0.0.0/24 and 10.0.1.0/24"
}

variable "load_balancers" {
  type        = list
  default     = []
  description = "The load balancers to couple to the instances"
}

variable "availability_zones" {
  type        = list
  description = "List of availability zones you want. Example: eu-west-1a and eu-west-1b"
}

variable "max_size" {
  type        = number
  description = "Maximum size of the nodes in the cluster"
}

variable "min_size" {
  type        = number
  description = "Minimum size of the nodes in the cluster"
}

variable "desired_capacity" {
  type        = number
  description = "The desired capacity of the cluster"
}

variable "instance_type" {
  type        = string
  description = "AWS instance type to use"
}

variable "ecs_aws_ami" {
  type        = string
  description = "The AWS ami id to use for ECS"
}

variable "custom_userdata" {
  type        = string
  default     = ""
  description = "Inject extra command in the instance template to be run on boot"
}

variable "ecs_config" {
  type        = string
  default     = "echo '' > /etc/ecs/ecs.config"
  description = "Specify ecs configuration or get it from S3. Example: aws s3 cp s3://some-bucket/ecs.config /etc/ecs/ecs.config"
}

variable "ecs_logging" {
  type        = string
  default     = "[\"json-file\",\"awslogs\"]"
  description = "Adding logging option to ECS that the Docker containers can use. It is possible to add fluentd as well"
}

variable "cloudwatch_prefix" {
  type        = string
  default     = ""
  description = "If you want to avoid cloudwatch collision or you don't want to merge all logs to one log group specify a prefix"
}
