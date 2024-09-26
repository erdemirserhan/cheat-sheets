# elastic ip

resource "aws_eip" "lb" {
  domain   = "vpc"
}
