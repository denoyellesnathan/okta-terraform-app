# Okta Terraform App

This project is designed to manage Okta resources using Terraform. It provides a streamlined way to configure and deploy Okta applications, users, groups, and other resources as code.

## Features

- Automates the provisioning of Okta resources.
- Supports version-controlled infrastructure as code.
- Simplifies management of Okta applications and configurations.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your system.
- An Okta account with API access.
- An Okta API token.

## Setup

1. Clone this repository:
   ```bash
   git clone https://github.com/your-repo/okta-terraform-app.git
   cd okta-terraform-app
   ```

2. Configure your Okta provider in `env/*.tfvars`:
   ```hcl
   okta_org_name = "your-okta-org"
   okta_api_token = "your-api-token"
   ```

3. Initialize Terraform:
   ```bash
   terraform init
   ```

4. Plan and apply the configuration:
   ```bash
   make plan
   make apply
   ```

## File Structure

- `main.tf`: Main Terraform configuration file.
- `variables.tf`: Defines input variables for the project.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
