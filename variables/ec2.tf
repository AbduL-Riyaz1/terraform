resource "aws_instance" "this" {
  ami                         = var.ami_id
  vpc_security_group_ids      = [aws_security_group.allow_tls.id]
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id /* if you don't have default subnet mentoin like this or else no need to give it takes default */
  associate_public_ip_address = true /* if it doesnot show public ip after ceartion of ec2-instance keep this as true */
  tags                        = var.ec2_tags
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = var.vpc_id /* if you don't have default vpc mentoin likr this or else no need to give it takes default */

  ingress {
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.sg_tags
}