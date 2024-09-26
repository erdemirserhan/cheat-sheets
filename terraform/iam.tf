resource "aws_iam_user" "myuser" {
    #name = "testing_stuff-${count.index}"
    name = "var.dev_names[count.index]" # dev_names = ["bob", "alice", "test"]
    # testing_stuff1, 2, 3, 4
    count = 3
}
