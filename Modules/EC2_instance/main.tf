resource "aws_instance" "vm" {
  ami           = var.ami
  instance_type = "t3.micro"

  network_interface {
    network_interface_id = var.network_interface_id
    device_index         = 0
  }
  tags = {
    Name = var.name
  }
}

output "ec2_id" {
    value = aws_instance.vm.id
}

