provider "aws" {
    region = "ap-south-1"
}
resource "aws_instance" "myfirstinstance" {
    ami = "ami-051a31ab2f4d498f5"
    instance_type = "t2.micro"
    tags = {
        Name = "dev-server"
    }
}