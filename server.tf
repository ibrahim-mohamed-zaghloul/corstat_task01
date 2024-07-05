
resource "aws_instance" "corstat" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.corstat.id]
  subnet_id                   = aws_subnet.public_subnet[0].id
  associate_public_ip_address = true
  tags = {
    Name = "Corstat-Server"
  }
}

resource "aws_security_group" "corstat" {
  name        = "corstat-security-group"
  description = "Allow access"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 22 #SSH
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80 #Nginx --> HTTP
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

output "corstat_ec2_ip" {
  value = aws_instance.corstat.public_ip
}