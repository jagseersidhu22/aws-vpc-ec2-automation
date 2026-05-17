resource "aws_route_table" "r_table" {
    vpc_id = var.vpc_id

    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.gateway_id
    }
  
}


resource "aws_route_table_association" "r_table_assoc" {
    subnet_id = var.subnet_id
    route_table_id = aws_route_table.r_table.id
}

output "route_table_id" {
    value = aws_route_table.r_table.id
}