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

environments/

dev/
main.tf
outputs.tf
provider.tf
terraform.tfvars
variables.tf

module/

s3/
main.tf
output.tf
variable.tf

main.tf

output.tf

provider.tf

variable.tf

README.md

🏗️ Architecture

The project follows a reusable Terraform module architecture.

Flow:

environments/dev → S3 Module → AWS S3 Bucket

The S3 bucket is configured with:

Versioning
AES256 server-side encryption
Public access blocking
Custom tags
🔧 How It Works

The development environment uses the reusable S3 module.

The module receives configuration values such as:

Bucket name
Bucket tags
Versioning status
Encryption type

The module then creates and configures the AWS S3 bucket.

🔐 S3 Security
Versioning

S3 bucket versioning is enabled.

Server-Side Encryption

The bucket uses AES256 server-side encryption.

Public Access Blocking

Public access is blocked using all four S3 public access block settings:

Block public ACLs
Block public bucket policies
Ignore public ACLs
Restrict public buckets

These settings help prevent accidental public exposure of the S3 bucket.

⚙️ Configuration

Development configuration is stored in:

environments/dev/terraform.tfvars

Example configuration:

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

Before deploying this project, make sure you have:

Terraform installed
AWS CLI installed
An AWS account
AWS credentials configured
Required AWS IAM permissions

Check Terraform:

terraform version


Check AWS authentication:

aws sts get-caller-identity

🚀 Deployment
Step 1: Go to the Project
cd terraform-S3-bucket

Step 2: Navigate to Development Environment
cd environments/dev

Step 3: Initialize Terraform
terraform init

Step 4: Format Terraform Files
terraform fmt -recursive

Step 5: Validate Configuration
terraform validate

Step 6: Review Terraform Plan
terraform plan

Step 7: Apply Configuration
terraform apply


Enter yes when Terraform asks for confirmation.

📤 Outputs

After deployment, view the outputs:

terraform output


The project provides information such as:

bucket_name
bucket_arn
🗑️ Destroy Infrastructure

To remove the infrastructure created by Terraform:

terraform destroy


Warning: Carefully review the resources before confirming the destroy operation.

🧩 S3 Module

The reusable S3 module is located at:

module/s3/

The module contains:

main.tf — AWS S3 resources and configuration
variable.tf — Module input variables
output.tf — Module outputs
Module Variables

The module accepts:

bucket_name
bucket_tags
versioning_status
Encryption
Module Outputs

The module provides:

bucket_name
bucket_arn
🌍 Environment Structure

The project currently contains a development environment:

environments/dev/

This structure can later be extended:

dev
staging
prod

Each environment can use the same reusable S3 module with different configuration values.

📚 Terraform Concepts Demonstrated

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
Reusable Terraform modules
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
