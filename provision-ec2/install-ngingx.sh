#!/bin/bash
sudo yum update -yum
sudo yum install nginx -y
sudo systemctl start nginx