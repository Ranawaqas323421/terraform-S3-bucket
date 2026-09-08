# s3 bucket 
#######
resource "aws_s3_bucket" "bucket" {
    bucket = var.bucket_name
    tags = var.bucket_tags
  
}
#versioning

resource "aws_s3_bucket_versioning" "versioning" {
bucket = aws_s3_bucket.bucket.id
versioning_configuration {
  status = var.versioning_status
}


}
# Encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "Encryption" {
    bucket = aws_s3_bucket.bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = var.Encryption
    }
  }
}
# Block Public Access
resource "aws_s3_bucket_public_access_block" "Public_Access" {
    bucket = aws_s3_bucket.bucket.id
      block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  
}
