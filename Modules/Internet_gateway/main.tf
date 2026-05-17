resource "aws_internet_gateway" "igw" {
    for_each = var.igws
    vpc_id = each.value.vpc_id
}

output "igw_id" {
    value = { for k, v in aws_internet_gateway.igw : k => v.id }
}

