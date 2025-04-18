terraform {
  required_providers {
    okta = {
      source  = "okta/okta"
      version = "~> 4.16.0"
    }
  }
}

resource "okta_app_oauth" "app_legacy_dev" {
  label                      = "${var.app_name} Legacy DEV"
  type                       = "web"
  grant_types                = ["authorization_code", "refresh_token"]
  redirect_uris              = [var.callback_url]
  response_types             = ["code"]
  post_logout_redirect_uris  = []
  login_uri                  = var.login_url
  token_endpoint_auth_method = "client_secret_basic"
  consent_method             = "TRUSTED"
  issuer_mode                = "ORG_URL"
  hide_web                   = false
  login_mode                 = "SPEC"
}

resource "okta_app_oauth" "app_legacy_int" {
  label                      = "${var.app_name} Legacy INT"
  type                       = "web"
  grant_types                = ["authorization_code", "refresh_token"]
  redirect_uris              = [var.callback_url]
  response_types             = ["code"]
  post_logout_redirect_uris  = []
  login_uri                  = var.login_url
  token_endpoint_auth_method = "client_secret_basic"
  consent_method             = "TRUSTED"
  issuer_mode                = "ORG_URL"
  hide_web                   = false
  login_mode                 = "SPEC"
}

resource "okta_app_oauth" "app_legacy_qa" {
  label                      = "${var.app_name} Legacy QA"
  type                       = "web"
  grant_types                = ["authorization_code", "refresh_token"]
  redirect_uris              = [var.callback_url]
  response_types             = ["code"]
  post_logout_redirect_uris  = []
  login_uri                  = var.login_url
  token_endpoint_auth_method = "client_secret_basic"
  consent_method             = "TRUSTED"
  issuer_mode                = "ORG_URL"
  hide_web                   = false
  login_mode                 = "SPEC"
}

resource "okta_app_group_assignment" "app_legacy_dev_group_assignment" {
  app_id   = okta_app_oauth.app_legacy_dev.id
  group_id = var.group_id
}

resource "okta_app_group_assignment" "app_legacy_int_group_assignment" {
  app_id   = okta_app_oauth.app_legacy_int.id
  group_id = var.group_id
}

resource "okta_app_group_assignment" "app_legacy_qa_group_assignment" {
  app_id   = okta_app_oauth.app_legacy_qa.id
  group_id = var.group_id
}
