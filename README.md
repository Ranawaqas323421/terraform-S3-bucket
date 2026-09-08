Terraform AWS S3 Bucket

A reusable Terraform project for creating and managing an AWS S3 bucket using Infrastructure as Code (IaC).

The project uses a modular Terraform structure and includes environment-specific configuration for a development environment.

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

The project follows a reusable module-based approach:

environments/dev
        │
        ▼
    S3 Module
        │
        ▼
   AWS S3 Bucket


The environments/dev configuration calls the reusable S3 module and passes environment-specific values such as the bucket name, tags, versioning status, and encryption type.

🔧 S3 Configuration

The S3 bucket is configured with the following security features:

Versioning

S3 bucket versioning is enabled.

versioning_status = "Enabled"


Versioning helps keep multiple versions of objects and can help recover from accidental changes or deletions.

Server-Side Encryption

The bucket uses AES256 server-side encryption.

Encryption = "AES256"

Public Access Blocking

The project blocks public access to the S3 bucket:

block_public_acls       = true
block_public_policy     = true
ignore_public_acls      = true
restrict_public_buckets = true


This helps prevent accidental public exposure of the bucket.

⚙️ Configuration

Environment-specific values are stored in:

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

Before using this project, install:

Terraform
AWS CLI
An AWS account
Proper AWS IAM permissions

Verify Terraform:

terraform version


Verify AWS credentials:

aws sts get-caller-identity

🚀 Deployment
1. Clone the Repository
git clone <repository-url>
cd terraform-S3-bucket

2. Go to Development Environment
cd environments/dev

3. Initialize Terraform
terraform init

4. Format Terraform Files
terraform fmt -recursive

5. Validate Configuration
terraform validate

6. Review the Terraform Plan
terraform plan

7. Create the Infrastructure
terraform apply


Enter yes when Terraform asks for confirmation.

📤 Terraform Outputs

After deployment, you can view the outputs with:

terraform output


The project provides information such as:

bucket_name
bucket_arn

🗑️ Destroy Infrastructure

To remove the infrastructure created by Terraform:

terraform destroy


Warning: Make sure you understand what resources will be deleted before running terraform destroy.

🧩 Terraform Module

The reusable S3 module is located in:

module/s3/

Module Files
module/s3/
├── main.tf
├── variable.tf
└── output.tf

main.tf

Contains the AWS S3 resources and their configuration.

variable.tf

Contains configurable module inputs:

bucket_name
bucket_tags
versioning_status
Encryption

output.tf

Provides useful information from the created S3 bucket:

bucket_name
bucket_arn

🌍 Environment Structure

The project currently contains a development environment:

environments/
└── dev/


The same structure can be extended for additional environments:

environments/
├── dev/
├── staging/
└── prod/


Each environment can use the same S3 module with different configuration values.

📚 Terraform Concepts

This project demonstrates:

Infrastructure as Code
Terraform providers
Terraform modules
Input variables
Output values
Environment-specific configuration
.tfvars files
AWS S3
S3 versioning
Server-side encryption
Public access blocking
Reusable infrastructure components
🔒 Recommended Improvements

For a production-ready setup, the project can be extended with:

Remote Terraform state
S3 backend
State locking
Terraform version constraints
AWS provider version constraints
S3 lifecycle policies
AWS KMS encryption
CI/CD pipeline
GitHub Actions
Separate AWS environments/accounts
IAM least-privilege policies
Monitoring and logging
👨‍💻 Author

Ranawaqas323421

📄 License

This project is created for learning, practice, and demonstration of Terraform and AWS infrastructure management.
