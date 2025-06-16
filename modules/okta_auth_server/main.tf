terraform {
  required_providers {
    okta = {
      source  = "okta/okta"
      version = "~> 4.16.0"
    }
  }
}

/**
 * # Okta Authorization Server Module
 *
 * This module creates a custom Okta authorization server with specific configurations:
 * - Restricts access to users in the "app_legacy" group
 * - Sets access token lifespan to 60 minutes
 * - Sets refresh token lifespan to 9 hours
 */

resource "okta_auth_server" "custom_auth_server" {
  name                    = var.name
  description             = var.description
  audiences               = var.audiences
  issuer_mode             = var.issuer_mode
  status                  = var.status
}

# Create a policy for the authorization server that restricts to app_legacy group
resource "okta_auth_server_policy" "app_legacy_policy" {
  auth_server_id   = okta_auth_server.custom_auth_server.id
  name             = "${var.name} Policy"
  description      = "Policy that restricts access to app_legacy group members"
  priority         = 1
  client_whitelist = var.client_whitelist
  status           = "ACTIVE"
}

# Create a rule for the policy that enforces group membership
resource "okta_auth_server_policy_rule" "app_legacy_rule" {
  auth_server_id       = okta_auth_server.custom_auth_server.id
  policy_id            = okta_auth_server_policy.app_legacy_policy.id
  name                 = "SERFF Legacy Group Access Rule"
  priority             = 1
  status               = "ACTIVE"
  grant_type_whitelist = ["authorization_code", "client_credentials", "urn:ietf:params:oauth:grant-type:device_code"]
  scope_whitelist      = [okta_auth_server_scope.serff_legacy_sso.name]
  group_whitelist      = [var.app_legacy_group_id]
  access_token_lifetime_minutes = 60
  refresh_token_lifetime_minutes = 270
  refresh_token_window_minutes   = 90
}

# Create default scopes for the authorization server
resource "okta_auth_server_scope" "serff_legacy_sso" {
  auth_server_id = okta_auth_server.custom_auth_server.id
  name           = "serff_legacy_sso"
  description    = "Scope for SERFF legacy SSO"
  metadata_publish = "ALL_CLIENTS"
  default        = true
}
