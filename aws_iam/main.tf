provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "admin-user" {
  name = "jamesw"
  tags = {
    name        = "James Bond"
    description = "Lead admin user"
  }
}

resource "aws_iam_policy" "adminUser" {
  name   = "AdminUsers"
  policy = <<-EOF
      {
        "Version":"2012-10-17",
        "Statement":[
          {
            "Effect" : "Allow",
            "Action" : "*",
            "Resource" : "*"
          }
        ]
      }
  EOF
}

resource "aws_iam_user_policy_attachment" "lames-admin-access" {
  user       = aws_iam_user.admin-user.name
  policy_arn = aws_iam_policy.adminUser.arn

}