variable "instance" {
  type = map(any)
  default = {
    mysql    = "t3.small"
    backend  = "t3.micro"
    frontend = "t3.micro"
  }
}

variable "zone_id" {
  default = "Z08924832RQM97SFT5BZF"
}

variable "domain_name" {
  default = "ardev.space"
}