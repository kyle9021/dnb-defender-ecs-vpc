variable "state_bucket_name" {
  type        = string
  default     = "dnb-tf-ecs"
  description = "Name of the s3 bucket containing state"
}

variable "ssh_key" {
  type        = string
  sensitive   = true
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCHuDHipTtZN2Ewd46tLrJ80fFRXhHz9hOIISgGs3iIPLcfHdgjrYQ73AvKK5jLaaRqRMqBOje1Yu9CFDogNaTNPEQmlUPVJRgrjREe89zco2KI19iTt8rjanLhQJiZ1xzDLmxE6BCyQ3kYRBB/HwjiEG959x6VCUPWcbCBImAeBldiY8eeEsz563YyZlSfkYjQVp02k22ihKF4OvifbocA51J7994DoCunlVpyZ10/iQOcfOSZLD9LOYPe9448OlzE8mYGBtc78XoZxK9vuFtHNn7/OUKcvEe6TD5AEPSPrXUeqW6UkbfQS514aSZ58ZxY9S2bgYJkiJPWez+lSK3z prisma-lab-gyu"
  description = "SSH Key for ECS Cluster"
}

variable "environment" {
  type        = string
  default     = "prisma-dvwa"
  description = "A name to describe the environment we're creating."
}

variable "aws_ecs_ami" {
  type        = string
  default     = ""
  description = "The AMI to seed ECS instances with."
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/24"
  description = "The IP range to attribute to the virtual network."
}

variable "public_subnet_cidrs" {
  type        = list
  default     = ["10.0.0.0/26", "10.0.0.64/26"]
  description = "The IP ranges to use for the public subnets in your VPC."
}

variable "private_subnet_cidrs" {
  type        = list
  default     = ["10.0.0.128/26", "10.0.0.192/26"]
  description = "The IP ranges to use for the private subnets in your VPC."
}

variable "availability_zones" {
  type        = list
  default     = ["us-east-1a", "us-east-1b"]
  description = "The AWS availability zones to create subnets in."
}

variable "max_size" {
  type        = number
  default     = 2
  description = "Maximum number of instances in the ECS cluster."
}

variable "min_size" {
  type        = number
  default     = 1
  description = "Minimum number of instances in the ECS cluster."
}

variable "desired_capacity" {
  type        = number  
  default     = 2
  description = "Ideal number of instances in the ECS cluster."
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Size of instances in the ECS cluster."
}
