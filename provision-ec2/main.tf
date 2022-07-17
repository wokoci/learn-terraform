resource "aws_instance" "my_instance" {
  instance_type = "t2.micro"
  ami           = "ami-0cff7528ff583bf9a"

}