
resource "aws_instance" "machine" {
  count = var.number_of_instances
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.key_pair.key_name
  tags = {
    Name = "Frontend-${count.index}"
  }
}

resource "aws_key_pair" "key_pair" {
    key_name   = var.key_name
    public_key = file(var.public_key_path)
}

resource "aws_security_group" "allow_ssh" {
    name        = "${random_string.random.result}-allow_ssh"
    description = "Allow SSH inbound traffic"
    vpc_id      = null

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_network_interface_sg_attachment" "sg_attachment" {
    count                = var.number_of_instances
    security_group_id    = aws_security_group.allow_ssh.id
    network_interface_id = aws_instance.machine[count.index].primary_network_interface_id
}


resource "random_string" "random" {
  length           = 4
  special          = false
}