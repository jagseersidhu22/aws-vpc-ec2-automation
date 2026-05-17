resource "aws_eip" "eip" {
  
  network_interface = var.network_interface
    tags = {
        Name = var.eip_name
    }
  
}

output "eip_id" {
    value = aws_eip.eip.id
}

