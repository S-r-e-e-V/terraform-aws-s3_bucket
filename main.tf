provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "s3_bucket" {
    bucket=var.bucket_name

    tags = {
    Name        = var.bucket_name
    Environment = "Dev"
  }
}
resource "aws_s3_bucket_versioning" "s3_versioning" {
  bucket = aws_s3_bucket.s3_bucket.id
  versioning_configuration {
    status = var.bucket_versioning
  }
}

# resource "aws_s3_bucket_policy" "blockPublicAccess" {
#   bucket = aws_s3_bucket.s3_bucket.id
#   policy = data.aws_iam_policy_document.blockPublicAccessDoc.json
# }

# data "aws_iam_policy_document" "blockPublicAccessDoc" {
#   statement {
#     sid = "blockPublicAccess"
#     principals {
#       type = "AWS"
#       identifiers = ["*"]
#     }
#     effect = "Allow"
#     actions = ["s3:*"]
#     resources = [
#       aws_s3_bucket.s3_bucket.arn,
#       "${aws_s3_bucket.s3_bucket.arn}/*"
#       ]
#     condition {
#       test="StringNotEquals"
#       variable = "aws:PrincipalArn"
#       values   = [
#         "arn:aws:iam::438465167486:root",
#         "arn:aws:iam::438465167486:user/Admin@Sreekanth2598"
#       ]
#     }
#   }
# }