resource "aws_s3_bucket" "data_bucket" {
  bucket = "project-bucket"
  acl    = "private"
}

output "bucket_name" {
  value = aws_s3_bucket.data_bucket.bucket
