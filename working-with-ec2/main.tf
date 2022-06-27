
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
                systemctl enable nginx
                sudo systemctl start nginx
                EOF

    key_name = aws_key_pair.webKey.id
}

resource "aws_key_pair" "webKey" {
  public_key = file("${path.root}/.ssh/myKey.cer")
}
