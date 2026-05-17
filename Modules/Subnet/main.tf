resource "aws_subnet" "subnet" {
    for_each = var.subnets
    vpc_id = each.value.vpc_id
    cidr_block = each.value.cidr_block
   map_public_ip_on_launch = each.value.map_public_ip_on_launch
    tags = {
        Name = each.key
    }
  
}

output "subnet_id" {
    value = {for k, v in aws_subnet.subnet : k => v.id }
  
}

