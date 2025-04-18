# Okta OAuth Application Module

This module is designed to manage Okta OAuth applications using Terraform. It simplifies the creation and configuration of OAuth applications in Okta.

## Features

- Automates the creation of OAuth applications in Okta.
- Configures client credentials, redirect URIs, and other OAuth settings.
- Supports customization through input variables.

## Usage

Include this module in your Terraform configuration:

```hcl
module "okta_oauth_app" {
  source = "./modules/okta_app_oauth"

  app_name       = "example-app"
  redirect_uris  = ["https://example.com/callback"]
  client_type    = "service"
  grant_types    = ["authorization_code", "refresh_token"]
  response_types = ["code"]
}
```

## Inputs

| Name           | Description                              | Type   | Default | Required |
|----------------|------------------------------------------|--------|---------|----------|
| `app_name`     | The name of the OAuth application.       | string | n/a     | yes      |
| `redirect_uris`| List of redirect URIs for the app.       | list   | n/a     | yes      |
| `client_type`  | The type of client (e.g., service).      | string | n/a     | yes      |
| `grant_types`  | List of OAuth grant types.               | list   | n/a     | yes      |
| `response_types`| List of OAuth response types.           | list   | n/a     | yes      |

## License

This module is licensed under the MIT License. See the `LICENSE` file for details.
