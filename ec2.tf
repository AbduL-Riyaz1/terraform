resource "aws_instance" "this" {
  ami                         = "ami-09c813fb71547fc4f"
  vpc_security_group_ids      = [aws_security_group.allow_tls.id]
  instance_type               = "t3.micro"
  subnet_id                   = "subnet-092d2c17ac793a2f6"
  associate_public_ip_address = true
  tags = {
    Name   = "terraform-demo"
    Prpose = "terraform-practice"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = "vpc-0a3f89b652495034b"

  ingress {
    from_port   = 22
    to_port     = 22
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
    Name = "allow_tls"
  }
}