# AWS Lambda Deployment with GitHub Actions and Terraform

This repository contains GitHub Actions pipeline and Terraform configuration to deploy an AWS Lambda function. The code in this repository is used in a blog post on [aflal.codes](https://aflal.codes).

## Prerequisites

- [Terraform](https://www.terraform.io/)
- [AWS CLI](https://aws.amazon.com/cli/)
- [GitHub Account](https://github.com/)

## Installation

1. Clone the repository:

   ```sh
   git clone https://github.com/your-username/your-repo.git
   cd your-repo
   ```

2. Install dependencies:
   ```sh
   terraform init
   ```

## Usage

1. **Configure AWS CLI**:

   ```sh
   aws configure
   ```

2. **Run Terraform Plan**:

   ```sh
   terraform plan plan.tfplan
   ```

3. **Apply Terraform Configuration**:

   ```sh
   terraform apply plan.tfplan
   ```

4. **GitHub Actions Pipeline**:
   - The GitHub Actions pipeline is configured to automatically deploy the AWS Lambda function when changes are merged to main.
   - Ensure your GitHub repository is connected to your AWS account and the necessary secrets are set up in the repository settings.

## Blog Post

For more detailed information, please refer to the [blog post](https://aflal.codes/posts/deploying-lambda-using-github-actions).

## License

This project is licensed under the Apache License Version 2.0 - see the [LICENSE](LICENSE) file for details.
