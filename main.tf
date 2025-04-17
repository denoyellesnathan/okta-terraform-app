terraform {
  required_providers {
    okta = {
      source  = "okta/okta"
      version = "~> 4.16.0"
    }
  }
}

provider "okta" {
  org_name    = "dev-76952744"
  base_url    = "okta.com"
  client_id   = "0oaobyawnytbnmJxo5d7"
  scopes      = ["okta.groups.manage", "okta.apps.manage", "okta.policies.read"]
  private_key = "okta.pem"
}

resource "okta_group" "app_legacy" {
  name = "APP_LEGACY_USERS_PR"
}

resource "okta_app_oauth" "app_legacy_dev" {
  label                      = "APP Legacy DEV"
  type                       = "web"
  grant_types                = ["authorization_code", "refresh_token"]
  redirect_uris              = ["https://example.com/oauth2/callback"]
  response_types             = ["code"]
  post_logout_redirect_uris  = ["https://example.com"]
  login_uri                  = "https://localhost:8443/login"
  token_endpoint_auth_method = "client_secret_basic"
  consent_method             = "TRUSTED"
  issuer_mode                = "ORG_URL"
  hide_web                   = false
  login_mode                 = "SPEC"
}

resource "okta_app_oauth" "app_legacy_int" {
  label                      = "APP Legacy INT"
  type                       = "web"
  grant_types                = ["authorization_code", "refresh_token"]
  redirect_uris              = ["https://example.com/oauth2/callback"]
  response_types             = ["code"]
  post_logout_redirect_uris  = ["https://example.com"]
  login_uri                  = "https://localhost:8443/login"
  token_endpoint_auth_method = "client_secret_basic"
  consent_method             = "TRUSTED"
  issuer_mode                = "ORG_URL"
  hide_web                   = false
  login_mode                 = "SPEC"
}

resource "okta_app_oauth" "app_legacy_qa" {
  label                      = "APP Legacy QA"
  type                       = "web"
  grant_types                = ["authorization_code", "refresh_token"]
  redirect_uris              = ["https://example.com/oauth2/callback"]
  response_types             = ["code"]
  post_logout_redirect_uris  = ["https://example.com"]
  login_uri                  = "https://localhost:8443/login"
  token_endpoint_auth_method = "client_secret_basic"
  consent_method             = "TRUSTED"
  issuer_mode                = "ORG_URL"
  hide_web                   = false
  login_mode                 = "SPEC"
  depends_on                 = [okta_group.app_legacy]
}

resource "okta_app_group_assignment" "app_legacy_group_assignment" {
  app_id   = okta_app_oauth.app_legacy_dev.id
  group_id = okta_group.app_legacy.id
}

resource "okta_app_group_assignment" "app_legacy_int_group_assignment" {
  app_id   = okta_app_oauth.app_legacy_int.id
  group_id = okta_group.app_legacy.id
}

resource "okta_app_group_assignment" "app_legacy_qa_group_assignment" {
  app_id   = okta_app_oauth.app_legacy_qa.id
  group_id = okta_group.app_legacy.id
}
