resource "aws_instance" "my_instance" {
  instance_type = "t2.micro"
  ami           = "ami-0cff7528ff583bf9a"

  tags = {
    key   = "Name"
    value = "Nginx web server"
  }
}


resource "aws_key_pair" "cerberus-key" {
    key_name = "cerberus"
    public_key = file(".ssh/cerberus.pub")
}

