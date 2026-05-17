resource "aws_network_interface" "eni" {
    for_each = var.enis
    subnet_id = each.value.subnet_id
    private_ip = each.value.private_ip
    security_groups = each.value.security_groups
    tags = {
        Name = each.key
    }
}   

output "eni_id" {
    value = {for k, v in aws_network_interface.eni : k => v.id }
  
}


