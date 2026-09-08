bucket_name = "2star-s3"

bucket_tags = {
  Project     = "TerraformS3"
  Owner       = "DevOpsTeam"
  Name        = "terraform-demo-bucket-dev"
  Environment = "dev"
}

versioning_status = "Enabled"
Encryption        = "AES256"