
variable "vpc_id" {
    description = "The ID of the VPC to which the route table belongs"
    type = string
}

variable "gateway_id" {
    description = "The ID of the internet gateway to which the route table will route traffic"
    type = string
}

variable "subnet_id" {
    description = "The ID of the subnet to associate with the route table"
    type = string
}