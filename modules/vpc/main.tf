resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr
  enable_dns_hostnames = true

  tags = {
    Name        = var.environment
    Environment = var.environment
    yor_trace   = "750ba813-ed6f-44ff-aa4f-2631470a1eae"
  }

}

resource "aws_internet_gateway" "vpc" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Environment = var.environment
    yor_trace   = "0bf5ae36-1cde-4969-93f3-b4eb3d2f8d01"
  }

}
