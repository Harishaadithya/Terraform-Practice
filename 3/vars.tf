variable "amis" {
  type = map
  default = {
    us-east-2 = "ami-0d5d9d301c853a04a"
  }
}

variable "Public_key" {
  default = "mykey.pub"
}


variable "Private_key" {
  default = "mykey"
}


variable "region" {
  default = "us-east-2"
}
