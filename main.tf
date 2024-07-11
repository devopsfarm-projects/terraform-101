# module "team1" {
#     source = "./module/vpc_instance"
#     cidr_subnet1 = "10.0.1.0/24"
#     vpc_cidr = "10.0.0.0/16"
#     environment = "team1"
# }




# module "team2" {
#     source = "./module/vpc_instance"
#     cidr_subnet1 = "10.1.1.0/24"
#     vpc_cidr = "10.1.0.0/16"
#     environment = "team2"
# }

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


resource "aws_security_group" "main" {
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ansible_security_group"
  }
}


resource "aws_instance" "ansible_demo" {
  for_each   = toset(var.ansible_machines)
  ami           = data.aws_ami.ubuntu.id  
  instance_type = "t2.micro"
  security_groups = [aws_security_group.main.name]
  user_data = file("files/userdata.sh")
  tags = {
    Name = "${each.key}"
  }
}


variable "ansible_machines" {
    default = ["ansbile-managed-vm1", "ansbile-managed-vm2"]
}

# Output SSH connection strings
output "ssh_connect_strings" {
  value = [
    for idx in var.ansible_machines : 
    "ssh ansible@${aws_instance.ansible_demo[idx].public_ip}"
  ]
}