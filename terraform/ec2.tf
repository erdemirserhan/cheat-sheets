provider "aws" {
  region     = "eu-central-1"
  access_key = "PUT-YOUR-ACCESS-KEY-HERE"
  secret_key = "PUT-YOUR-SECRET-KEY-HERE"
}

resource "aws_instance" "myec2" {
    ami = "ami-<some_numbers_here>"
    instance_type = var.instancetype
    count = 3
    tags = {
        Name = "security-team-${count.index}" # count indexing
    }
}
