variable "environment" {
    default = "development"
}

variable "region" {
    default = "eu-central-1"
}

resource "aws_instance" "example" {
    instance_type = var.environment == "development" && var.region == "eu-central-2" ? "t2.micro" : "m5.large" # syntax, like js. If true development, then micro, else large
    ami = "ami-121331412345"
    tags = {
        Name = "My-Instance"
    }
}
