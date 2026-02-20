provider "aws" {
    region = "ap-south-1"
}
data "aws_security_group" "existing_sg" {
    name = "launch-wizard-9"
}
variable "vm_count" {
  type = number
  default = 2
}
locals {
    server_names = [
        for i in range(1, var.vm_count + 1) : "test-server-${i}"
    ]
}
resource "aws_instance" "servers" {
    for_each = toset(local.server_names)
    ami = "ami-051a31ab2f4d498f5"
    instance_type = "t2.micro"
    key_name = "keypair-b8"

    vpc_security_group_ids = [
        data.aws_security_group.existing_sg.id
    ]
    tags = {
        Name = each.key
    }
}