module "s3" {
    source = "../../module/s3"
  bucket_name = var.bucket_name

bucket_tags = var.bucket_tags

versioning_status = var.versioning_status
Encryption        = var.Encryption
}