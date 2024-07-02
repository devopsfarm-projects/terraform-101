data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# resource "aws_instance" "web" {
#   count         = 40
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = var.ec2_instance_type

#   tags = {
#     Name = "${var.ec2_instance_name}-${count.index}"
#   }
# }


resource "aws_instance" "vms" {
  for_each  = toset(var.vm_stack)

  # each.key will set to the element in list
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.ec2_instance_type

  tags = {
    Name = "${local.ec2_instance_prefix}-${each.key}"
  }

}

# count   == number 
# foreach == list("web1", "web2", "web3")





locals {
  ec2_instance_prefix = "opaliwal_created_"
}




# three tier ---- frontend, backend, database

variable "vm_stack" {
  type = list
  default = ["frontend", "backend", "db"]
}


variable "ec2_instance_name" {
  type = string
  # default = "terraform101_1"
}


variable "ec2_instance_type" {
  type = string
  default = "t3.micro"
}

variable "create_instance" {
  default = false
}


# output "ssh_string" {
#   value       = "ssh -i id_rsa ubuntu@${aws_instance.web[0].public_dns}"
# }


# conditonals 
# loops
