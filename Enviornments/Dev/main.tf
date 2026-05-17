############ VPC ############


module "vpc" {
    source = "../../Modules/VPC"
    vpcs = {
        vpc1 = {
            cidr_block = "10.0.0.0/16"
        }
    }
}

############ Subnet ############
module "subnet" {
    source = "../../Modules/Subnet"
    subnets = {
        subnet_EC2_frontend = {
            vpc_id = module.vpc.vpc_id["vpc1"]
            cidr_block = "10.0.1.0/24"
            map_public_ip_on_launch = true
        }
    }
}

############ Internet Gateway ############
module "igw" {
    source = "../../Modules/Internet_gateway"
    igws = {
        igw1 = {
            vpc_id = module.vpc.vpc_id["vpc1"]
        }
    }
}

############ Route Table ############
module "route_table" {
    source = "../../Modules/Route_table"
    vpc_id = module.vpc.vpc_id["vpc1"]
    gateway_id = module.igw.igw_id["igw1"]
    subnet_id = module.subnet.subnet_id["subnet_EC2_frontend"]
}

##########Security Group ############
module "security_group" {
    source = "../../Modules/Security_groups"
    name = "frontend_sg"
    vpc_id = module.vpc.vpc_id["vpc1"]
    ssh_cidr = ["0.0.0.0/0"]
    http_cidr = ["0.0.0.0/0"]
}

########## ENI ############
module "eni" {
    source = "../../Modules/ENI"
    enis = {
        eni1 = {
            subnet_id = module.subnet.subnet_id["subnet_EC2_frontend"]
            private_ip = "10.0.1.10"
            security_groups = [module.security_group.sg_id]
        }
    }
}

########## EIP ############
module "eip" {
    source = "../../Modules/EIP"
    network_interface = module.eni.eni_id["eni1"]
    eip_name = "frontend_eip"
}


########## EC2 Instance ############
module "ec2_instance" {
    source = "../../Modules/EC2_instance"
    ami = data.aws_ami.amazon_linux.id
    network_interface_id = module.eni.eni_id["eni1"]
    name = "frontend_instance"
}