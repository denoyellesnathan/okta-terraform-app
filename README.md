# Okta Terraform App

This project is designed to manage Okta resources using Terraform. It provides a streamlined way to configure and deploy Okta applications, groups, and other resources as code.

## Features

- Automates the management of Okta resources.
- Uses Terraform for infrastructure as code.
- Supports version control for Okta configurations.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your system.
- An Okta account with API access.
- Terraform Okta provider configured.

## Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo/okta-terraform-app.git
   cd okta-terraform-app
   ```

2. Configure your Okta provider in `main.tf`:
   ```hcl
   provider "okta" {
     org_name  = "your-okta-org"
     api_token = "your-api-token"
   }
   ```

3. Initialize Terraform:
   ```bash
   terraform init
   ```

4. Plan and apply your changes:
   ```bash
   terraform plan
   terraform apply
   ```

## Project Structure

- `.gitignore`: Specifies files and directories to be ignored by Git.
- `main.tf`: Main Terraform configuration file.
- `variables.tf`: Defines input variables for the Terraform configuration.
- `outputs.tf`: Defines outputs for the Terraform configuration.

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.
