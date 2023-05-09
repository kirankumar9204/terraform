# resource "aws_s3_bucket" "terraform-bucket" {
#   bucket = "test-bucket-terraform"

#   tags = {
#     Name        = "tf test bucket"
#     Environment = "test"
#   }
# }

# resource "aws_s3_bucket_acl" "access-control-list" {
#   bucket = aws_s3_bucket.terraform-bucket.id
#   acl    = "private"
# }

# resource "aws_s3_bucket_versioning" "versioning_config" {
#   bucket = aws_s3_bucket.terraform-bucket.id
#   versioning_configuration {
#     status = "Disabled"
#   }
# }




# resource "aws_s3_bucket_lifecycle_configuration" "bucket-config" {
#   bucket = aws_s3_bucket.terraform-bucket.id

#   rule {
#     id = "log"

#     expiration {
#       days = 1
#     }

#     filter {
#       and {
#         prefix = "log/"

#         tags = {
#           rule      = "log"
#           autoclean = "true"
#         }
#       }
#     }

#     status = "Enabled"

#     transition {
#       days          = 1
#       storage_class = "STANDARD_IA"
#     }

#     transition {
#       days          = 1
#       storage_class = "GLACIER"
#     }
#   }

#   rule {
#     id = "tmp"

#     filter {
#       prefix = "tmp/"
#     }

#     expiration {
#       date = "2023-03-17T00:00:00Z"
#     }

#     status = "Enabled"
#   }
# }

