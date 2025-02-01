variable "ami_id" {
  type        = string
  default     = "ami-09c813fb71547fc4f"
  description = "This is RHEL9 AMI id"
}

variable "environment" {
  default = "dev"
  
}

variable "instance_type" {
  default = "t3.micro"
} 

variable "subnet_id" {
  type    = string
  default = "subnet-092d2c17ac793a2f6"

}

variable "ec2_tags" {
  type = map(any)
  default = {
    project     = "expense"
    component   = "backend"
    Environment = "dev"
    Name        = "expense-backend-dev"
  }
}

variable "vpc_id" {
  type    = string
  default = "vpc-0a3f89b652495034b"

}
variable "from_port" {
  type    = number
  default = 22

}

variable "to_port" {
  type    = number
  default = 22

}

variable "cidr_blocks" {
  type    = list(any)
  default = ["0.0.0.0/0"]

}

variable "sg_tags" {
  type = map(any)
  default = {
    Name = "expense-backend-dev"
  }

}

