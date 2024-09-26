variable "instancetype" {
  default = "t2.micro"
}


variable "dev_names" {
  type = list
  default = ["bob", "alice", "test"]
}
