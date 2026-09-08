Terraform AWS S3 Bucket

A reusable Terraform project for creating and managing an AWS S3 bucket using Infrastructure as Code (IaC).

This project uses a modular Terraform structure with environment-specific configuration for a development environment.

🚀 Features
AWS S3 bucket creation using Terraform
Reusable Terraform S3 module
Development environment configuration
S3 bucket versioning
Server-side encryption using AES256
S3 public access blocking
Configurable bucket tags
Terraform variables and outputs
Environment-based project structure
📁 Project Structure
terraform-S3-bucket/
│
├── environments/
│   └── dev/
│       ├── main.tf
│       ├── outputs.tf
│       ├── provider.tf
│       ├── terraform.tfvars
│       └── variables.tf
│
├── module/
│   └── s3/
│       ├── main.tf
│       ├── output.tf
│       └── variable.tf
│
├── main.tf
├── output.tf
├── provider.tf
├── variable.tf
└── README.md

🏗️ Architecture
Terraform
    |
    v
environments/dev
    |
    v
S3 Module
    |
    v
AWS S3 Bucket
    |
    +-- Versioning
    |
    +-- AES256 Encryption
    |
    +-- Public Access Blocking

🔧 How It Works

The development environment uses the reusable S3 module.

module "s3" {
  source = "../../module/s3"

  bucket_name       = var.bucket_name
  bucket_tags       = var.bucket_tags
  versioning_status = var.versioning_status
  Encryption        = var.Encryption
}


The module creates and configures the AWS S3 bucket.

🔐 S3 Security
Versioning

S3 bucket versioning is enabled:

versioning_status = "Enabled"

Server-Side Encryption

The bucket uses AES256 server-side encryption:

Encryption = "AES256"

Public Access Blocking

Public access is blocked using:

block_public_acls       = true
block_public_policy     = true
ignore_public_acls      = true
restrict_public_buckets = true


These settings help prevent accidental public exposure of the bucket.

⚙️ Configuration

Development environment configuration is stored in:

environments/dev/terraform.tfvars


Example:

bucket_name = "2star-s3"

bucket_tags = {
  Project     = "TerraformS3"
  Owner       = "DevOpsTeam"
  Name        = "terraform-demo-bucket-dev"
  Environment = "dev"
}

versioning_status = "Enabled"
Encryption        = "AES256"

🛠️ Prerequisites
Terraform
AWS CLI
AWS account
AWS credentials
Required AWS IAM permissions

Check Terraform:

terraform version


Check AWS authentication:

aws sts get-caller-identity

🚀 Deployment
1. Navigate to the Project
cd terraform-S3-bucket

2. Go to the Development Environment
cd environments/dev

3. Initialize Terraform
terraform init

4. Format the Configuration
terraform fmt -recursive

5. Validate the Configuration
terraform validate

6. Review the Plan
terraform plan

7. Apply the Configuration
terraform apply


Enter yes when Terraform asks for confirmation.

📤 Outputs

After deployment:

terraform output


Available outputs include:

bucket_name
bucket_arn

🗑️ Destroy Infrastructure

To remove the infrastructure:

terraform destroy


Warning: Review the resources carefully before confirming the destroy operation.

🧩 S3 Module

The reusable S3 module is located at:

module/s3/
├── main.tf
├── variable.tf
└── output.tf

main.tf

Contains the AWS S3 resources and configuration.

variable.tf

Defines the module input variables:

bucket_name
bucket_tags
versioning_status
Encryption

output.tf

Defines the module outputs:

bucket_name
bucket_arn

🌍 Environment Structure

The current environment is:

environments/
└── dev/
    ├── main.tf
    ├── outputs.tf
    ├── provider.tf
    ├── terraform.tfvars
    └── variables.tf


Additional environments can be added later:

environments/
├── dev/
├── staging/
└── prod/

📚 Terraform Concepts

This project demonstrates:

Infrastructure as Code
Terraform providers
Terraform modules
Input variables
Output values
.tfvars files
AWS S3
S3 versioning
Server-side encryption
Public access blocking
Environment-based infrastructure
Reusable modules
🔒 Recommended Improvements

For production environments, consider adding:

Remote Terraform state
S3 backend
State locking
Terraform version constraints
AWS provider version constraints
S3 lifecycle policies
AWS KMS encryption
CI/CD pipeline
GitHub Actions
IAM least-privilege policies
Monitoring and logging
👨‍💻 Author

Ranawaqas323421

📄 License

This project is created for learning, practice, and demonstration of Terraform and AWS infrastructure management.
