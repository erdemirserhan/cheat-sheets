# aws provider config
provider "aws" {
  region     = "us-east-1"
}

resource "aws_iam_user" "demouser" {
    name = "some-demo-user"
}
