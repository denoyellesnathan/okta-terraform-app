# Okta Authorization Server Module

This Terraform module creates a custom Okta authorization server with specific configurations:

- Restricts access to users in the "app_legacy" group
- Sets access token lifespan to 60 minutes
- Sets refresh token lifespan to 2 hours

## Features

- Creates a custom authorization server in Okta
- Configures a policy that restricts access to specific groups
- Sets up standard OpenID Connect scopes (openid, profile, email)
- Configures token lifespans according to requirements
- Adds standard claims for user information

## Usage

```hcl
module "okta_auth_server" {
  source = "./modules/okta_auth_server"
  
  name                = "My Custom Auth Server"
  description         = "Authorization server for legacy applications"
  audiences           = ["api://legacy-app"]
  app_legacy_group_id = "00g1abc2defGHIJKL" # Replace with your actual group ID
  
  # Optional: Override defaults
  # client_whitelist    = ["0oa1abc2defGHIJKL"] # Specific client IDs
  # issuer_mode         = "CUSTOM_URL"
  # status              = "ACTIVE"
}
```

## Requirements

- Okta provider configured in your Terraform environment
- Existing "app_legacy" group in your Okta organization

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Name of the authorization server | `string` | `"Custom Authorization Server"` | no |
| description | Description of the authorization server | `string` | `"Custom authorization server for application access"` | no |
| audiences | List of audiences for the authorization server | `list(string)` | `["api://default"]` | no |
| issuer_mode | Issuer mode for the authorization server | `string` | `"ORG_URL"` | no |
| status | Status of the authorization server | `string` | `"ACTIVE"` | no |
| client_whitelist | List of client IDs that are allowed to use this authorization server | `list(string)` | `["ALL_CLIENTS"]` | no |
| app_legacy_group_id | ID of the app_legacy group in Okta | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| auth_server_id | ID of the created authorization server |
| auth_server_issuer | Issuer URI of the authorization server |
| auth_server_policy_id | ID of the authorization server policy |
| auth_server_policy_rule_id | ID of the authorization server policy rule |
