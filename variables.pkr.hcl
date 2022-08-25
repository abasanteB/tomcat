variable "ami_prefix" {
  type    = string
  default = "packer_tomcat"
}

variable "region" {
  type    = string
  default = "us-west-2"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "source_ami" {
  type    = string
  default = "ami-08970fb2e5767e3b8"

}

variable "ssh_username" {
  type    = string
  default = "ec2-user"
}

variable "subnet_id" {
  type    = string
  default = "subnet-0d32b28d8c7454abc"
}



variable "tags" {
  type = map(string)
  default = {
    OS_Version    = "Red Hat Enterprise Linux 8 (HVM)"
    Release       = "Latest"
    Base_AMI_Name = "{{ .SourceAMIName }}"
    Name          = "pkr-img "
  }
}

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}