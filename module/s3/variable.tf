variable "bucket_name" {
    type = string
    default = "2star-s3"
  
}
variable "bucket_tags" {
    type = map(string)
    default = {
        Project     = "TerraformS3"
    Owner       = "DevOpsTeam"
    Name        = "terraform-demo-bucket-dev"
    Environment = "dev"

    }
  
}
variable "versioning_status" {
    type = string
    default = "Enabled"
  
}
variable "Encryption" {
    type = string
    default = "AES256"
  
}