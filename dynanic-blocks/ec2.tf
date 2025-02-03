resource "aws_instance" "this" {
  ami                         = "ami-09c813fb71547fc4f"
  vpc_security_group_ids      = [aws_security_group.allow_tls.id]
  instance_type               = "t3.micro"
  subnet_id                   = "subnet-092d2c17ac793a2f6" /* if you don't have default subnet mentoin like this or else no need to give it takes default */
  associate_public_ip_address = true /* if it doesnot show public ip after ceartion of ec2-instance keep this as true */
  tags = {
    Name   = "terraform-demo"
    Prpose = "terraform-practice"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = "vpc-0a3f89b652495034b" /* if you don't have default vpc mentoin likr this or else no need to give it takes default */

 dynamic "ingress" {    #Terraform will give a keyword with block name.you can iterate using ingress 
   for_each = var.ingress_ports
   content {
     from_port    = ingress.value["from_port"]
     to_port      = ingress.value["to_port"]
     protocol     = ingress.value["protocol"]
     cidr_blocks  = ingress.value["cidr_blocks"]
   }
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