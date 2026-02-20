provider "aws" {
    region = "ap-south-1"
}
resource "aws_security_group" "custom-sg" {
    name = "kastro-mumbai-sg"
}
resource "aws_instance" "custom-server" {
    ami = "ami-051a31ab2f4d498f5"
    instance_type = "t2.micro"
    key_name = "keypair-b8"
    count = 3

    vpc_security_group_ids = [
        resource.aws_security_group.custom-sg.id
    ]

    tags = {
        Name = "test-server-${count.index + 1}"
    }
}