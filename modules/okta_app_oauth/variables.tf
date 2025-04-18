variable "app_name" {
  description = "The name of the application."
  type        = string
}

variable "callback_url" {
  description = "The callback URL for the application."
  type        = string
}

variable "login_url" {
  description = "The login URL for the application."
  type        = string
}

variable "group_id" {
  description = "The ID of the Okta group to assign to the applications."
  type        = string
}
