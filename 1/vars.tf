variable "public" {
  default = "sarayu.pub"
}

variable "private" {
  default = "sarayu"
}

variable "user" {
  default = "ubuntu"
}



variable "ami" {
    type = map(string)
    default = {
        us-east-2 = "ami-0d5d9d301c853a04a"
    }
}

variable "region" {
  default = "us-east-2"
}

