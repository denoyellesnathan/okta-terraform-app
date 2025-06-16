variable "name" {
  description = "Name of the authorization server"
  type        = string
  default     = "Custom Authorization Server"
}

variable "description" {
  description = "Description of the authorization server"
  type        = string
  default     = "Custom authorization server for application access"
}

variable "audiences" {
  description = "List of audiences for the authorization server"
  type        = list(string)
  default     = ["api://default"]
}

variable "issuer_mode" {
  description = "Issuer mode for the authorization server"
  type        = string
  default     = "ORG_URL"
}

variable "status" {
  description = "Status of the authorization server"
  type        = string
  default     = "ACTIVE"
}

variable "client_whitelist" {
  description = "List of client IDs that are allowed to use this authorization server"
  type        = list(string)
  default     = ["ALL_CLIENTS"]
}

variable "app_legacy_group_id" {
  description = "ID of the app_legacy group in Okta"
  type        = string
}
