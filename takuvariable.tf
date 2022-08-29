variable "cidr_vpc" {
    type = string
    default = "10.0.0.0/16"
  
}

variable "cidr_subnet" {
    type = string
    default = "10.0.1.0/24"
  
}

variable "instance_type" {
    type = string
    default = "t2.micro"
  
}

variable "ami_id" {
    type = string
    default = "ami-01cc34ab2709337aa"
  
}
