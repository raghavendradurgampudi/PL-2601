provider "aws" {
    region = "ap-south-1"
}
data "aws_security_group" "existing_sg" {
    name = "launch-wizard-10"
}
resource "aws_instance" "dev-server" {
    count = 2
    ami = "ami-051a31ab2f4d498f5"
    instance_type = "t2.micro"
    key_name = "keypair-b8"

    vpc_security_group_ids = [
        data.aws_security_group.existing_sg.id
    ]

    tags = {
        Name = "dev-server-${count.index+1}"
    }
}