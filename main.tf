terraform {
  required_providers {
    okta = {
      source  = "okta/okta"
      version = "~> 4.16.0"
    }
  }
}

provider "okta" {
  org_name         = var.org_name
  base_url         = var.base_url
  client_id        = var.client_id
  scopes           = var.scopes
  private_key      = var.private_key
  max_api_capacity = 50
}

# This resource defines an Okta group for legacy users associated with the application.
# The group name is dynamically generated using the `app_name` variable, appended with "_LEGACY_USERS_PR".
# This group can be used to manage access control or permissions for legacy users of the application.
resource "okta_group" "app_legacy" {
  name = "${var.app_name}_LEGACY_USERS_PR"
}

# This module configures an Okta OAuth application with the specified parameters.
# 
# Arguments:
# - `source`: Specifies the path to the Okta OAuth module.
# - `app_name`: The name of the application to be created in Okta. This is passed as a variable.
# - `callback_url`: The callback URL for the OAuth application. This is passed as a variable.
# - `login_url`: The login URL for the OAuth application. This is passed as a variable.
# - `group_id`: The ID of the Okta group to associate with the application. This is derived from the `okta_group.app_legacy.id` resource.
#
# Usage:
# Ensure that the `var.app_name`, `var.callback_url`, and `var.login_url` variables are defined in your Terraform configuration.
# The `okta_group.app_legacy` resource must also be defined to provide the group ID.
module "app_legacy_oauth" {
  source       = "./modules/okta_app_oauth"
  app_name     = var.app_name
  callback_url = var.callback_url
  login_url    = var.login_url
  group_id     = okta_group.app_legacy.id
}

module "okta_auth_server" {
  source = "./modules/okta_auth_server"
  name                = "SERFF Legacy Auth Server"
  description         = "Authorization server for SERFF Legacy"
  audiences           = ["serff.com"]
  app_legacy_group_id = okta_group.app_legacy.id
  depends_on = [ module.app_legacy_oauth ]
  client_whitelist = module.app_legacy_oauth.okta_app_ids
}