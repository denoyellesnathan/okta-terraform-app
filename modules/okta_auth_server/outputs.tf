output "auth_server_id" {
  description = "ID of the created authorization server"
  value       = okta_auth_server.custom_auth_server.id
}

output "auth_server_issuer" {
  description = "Issuer URI of the authorization server"
  value       = okta_auth_server.custom_auth_server.issuer
}

output "auth_server_policy_id" {
  description = "ID of the authorization server policy"
  value       = okta_auth_server_policy.app_legacy_policy.id
}

output "auth_server_policy_rule_id" {
  description = "ID of the authorization server policy rule"
  value       = okta_auth_server_policy_rule.app_legacy_rule.id
}
