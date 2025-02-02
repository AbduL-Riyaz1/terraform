data "aws_ami" "joindevops" {
  most_recent      = true
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_vpc" "selected"{              #if you have default give "default" 
    id = "vpc-0a3f89b652495034b"        # and hear keep default =true
}

output "ami_id" {
  value = data.aws_ami.joindevops.id
}

output "aws_vpc" {
  value = data.aws_vpc.selected.id  # here give data.aws_vpc.selected
}