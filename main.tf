# VPC
# CIDR -- range of ips the resource will take 10.0.0.0/16  



resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${local.name_prefix}"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_subnet1

  tags = {
    Name = "${local.name_prefix}_public"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${local.name_prefix}_igw"
  }
}


resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }


  tags = {
    Name = "${local.name_prefix}_rt"
  }
}


resource "aws_route_table_association" "main" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.main.id
}


resource "aws_security_group" "main" {
  vpc_id = aws_vpc.main.id

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

  tags = {
    Name = "${local.name_prefix}_security_group"
  }
}

resource "aws_instance" "my_app" {
  ami           = data.aws_ami.ubuntu.id  
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.main.id
#   security_groups = [aws_security_group.main.name]

  tags = {
    Name = "${local.name_prefix}_machine"
  }
}