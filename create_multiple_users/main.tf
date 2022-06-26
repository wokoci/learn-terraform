resource "aws_iam_user" "users" {

  name  = var.def-users-group[count.index]
  count = length(var.def-users-group)
  tags = {
    "department" = "development"
  }
}



