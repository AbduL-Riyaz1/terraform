locals {
  ami_id = data.aws_ami.joindevops.id
  vpc_id = data.aws_vpc.selected.id
  instance_type = "t3.micro"
  name = "${var.project}-${var.component}-${var.environment}-changed"
}

