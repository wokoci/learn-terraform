resource "aws_instance" "webServer" {
  ami           = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"

  tags = {
    Name        = "webServer"
    Description = "An Nginx wWebserver on ubuntu"
  }

  user_data = <<-EOF
                #!/bin/bash
                sudo apt update
                sudo apt install nginx -y
                systemctl enable nginfx
                sudo systemctl start nginx
  EOF
}