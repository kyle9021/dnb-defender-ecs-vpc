# Using the AWS NAT Gateway service instead of a nat instance, it's more expensive but easier
# See comparison http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/vpc-nat-comparison.html

resource "aws_nat_gateway" "nat" {
  count = var.subnet_count

  allocation_id = element(aws_eip.nat.*.id, count.index)
  subnet_id     = element(var.subnet_ids, count.index)
  tags = {
    yor_trace = "ccacba68-5e9d-486a-b779-ec7a9193175c"
  }
}

resource "aws_eip" "nat" {
  count = var.subnet_count

  vpc = true
  tags = {
    yor_trace = "e1ba885d-1662-474c-b0aa-3fdd75bf7675"
  }
}
