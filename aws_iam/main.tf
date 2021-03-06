

resource "aws_iam_user" "admin-user" {
  name = "jamesw"
  tags = {
    name        = "James Bond"
    description = "Lead admin user"
  }
}

resource "aws_iam_policy" "adminUser" {
  name   = "AdminUsers"
  policy = file("admin-policy.json")
}

resource "aws_iam_user_policy_attachment" "lames-admin-access" {
  user       = aws_iam_user.admin-user.name
  policy_arn = aws_iam_policy.adminUser.arn

}