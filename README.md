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

The project follows a reusable module-based Terraform architecture:

                    Terraform
                        │
                        ▼
              environments/dev
                        │
                        │
                        ▼
                   S3 Module
                        │
                        │
                        ▼
                 AWS S3 Bucket
                        │
          ┌─────────────┼─────────────┐
          ▼             ▼             ▼
     Versioning    Encryption    Public Access
                                    Blocking


The dev environment uses the reusable S3 module and provides environment-specific configuration.

🔧 How It Works

The development environment calls the S3 module:

module "s3" {
  source = "../../module/s3"

  bucket_name       = var.bucket_name
  bucket_tags       = var.bucket_tags
  versioning_status = var.versioning_status
  Encryption        = var.Encryption
}


The module is responsible for creating and configuring the S3 bucket.

🔐 S3 Security Configuration

The S3 bucket includes multiple security configurations.

🔄 Versioning

Bucket versioning is enabled:

versioning_status = "Enabled"


Versioning allows multiple versions of objects to be maintained and can help recover from accidental changes or deletions.

🔒 Server-Side Encryption

The project uses AES256 server-side encryption:

Encryption = "AES256"


This provides encryption for objects stored in the S3 bucket.

🛡️ Public Access Blocking

Public access to the S3 bucket is blocked using:

block_public_acls       = true
block_public_policy     = true
ignore_public_acls      = true
restrict_public_buckets = true


These settings help prevent accidental public exposure of the S3 bucket.

⚙️ Configuration

Environment-specific configuration is stored in:

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

Before deploying this project, make sure you have:

Terraform installed
AWS CLI installed
An AWS account
AWS credentials configured
Appropriate AWS IAM permissions

Check Terraform:

terraform version


Check AWS authentication:

aws sts get-caller-identity

🚀 Deployment
1. Clone the Repository
git clone <repository-url>
cd terraform-S3-bucket

2. Navigate to the Development Environment
cd environments/dev

3. Initialize Terraform
terraform init

4. Format Terraform Files
terraform fmt -recursive

5. Validate the Configuration
terraform validate

6. Review the Terraform Plan
terraform plan

7. Apply the Configuration
terraform apply


Terraform will ask for confirmation before creating the infrastructure.

📤 Terraform Outputs

After deployment, view the Terraform outputs using:

terraform output


The project provides outputs such as:

bucket_name
bucket_arn


These outputs provide useful information about the created S3 bucket.

🗑️ Destroy Infrastructure

To remove the infrastructure created by Terraform:

terraform destroy


⚠️ Warning: Make sure you understand what resources will be deleted before confirming terraform destroy.

🧩 Terraform Module

The reusable S3 module is located at:

module/s3/


Its structure is:

module/s3/
├── main.tf
├── variable.tf
└── output.tf

main.tf

Contains the AWS S3 resources and their configuration.

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

The project currently contains a development environment:

environments/
└── dev/
    ├── main.tf
    ├── outputs.tf
    ├── provider.tf
    ├── terraform.tfvars
    └── variables.tf


The same structure can be extended for additional environments:

environments/
├── dev/
├── staging/
└── prod/


Each environment can use the same reusable S3 module with different configuration values.

📚 Terraform Concepts Demonstrated

This project demonstrates practical use of:

Infrastructure as Code (IaC)
Terraform providers
Terraform modules
Input variables
Output values
.tfvars configuration
AWS S3
S3 bucket versioning
Server-side encryption
Public access blocking
Environment-based infrastructure
Reusable infrastructure components
🔒 Recommended Improvements

For production use, the project could be extended with:

Remote Terraform state
S3 backend
Terraform state locking
Terraform version constraints
AWS provider version constraints
S3 lifecycle policies
AWS KMS encryption
CI/CD pipeline
GitHub Actions
Separate AWS environments or accounts
IAM least-privilege policies
Monitoring and logging
👨‍💻 Author

Ranawaqas323421

📄 License

This project is created for learning, practice, and demonstration of Terraform and AWS infrastructure management.
