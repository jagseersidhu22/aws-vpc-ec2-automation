resource "aws_vpc" "aws_vpc1" {
    for_each = var.vpcs
    cidr_block = each.value.cidr_block
  
  
}

output "vpc_id" {
  value = { for k, v in aws_vpc.aws_vpc1 : k => v.id }
}

