# create an s3 bucket
resource "aws_s3_bucket" "admin" {
  bucket = "adminx-depts-on-rhwmove-for-unique-55423432"
  tags = {
    Description = "Admin department"
  }
}
# add objects to thw bucket 
resource "aws_s3_object" "admin-files" {
  content = "working-with-s3/resilientarchitecture_(1)_21_46.png"
  key     = "resilientarchitecture_(1)_21_46.png"
  bucket  = aws_s3_bucket.admin.id
}

# create a data resource for the iam group
data "aws_iam_group" "appdevelopment-data" {
  group_name = "appdevelopment"
}
#  create a bucket bolicy for the bucket to allow access from the group of developers
resource "aws_s3_bucket_policy" "developer-policy" {
  bucket = aws_s3_bucket.admin.id
  policy = <<-EOF
   {
    "Version":"2012-10-17",
    "Statement":[{
        "Action":"Allow",
        "Effect":"Allow",
         "Resource":"arn:aws:s3:::${aws_s3_bucket.admin.id}/*",
        "Principal":{
            "AWS":[
                "${data.aws_iam_group.appdevelopment-data.arn}"
            ]
        }
   } ]
   }
   EOF
}