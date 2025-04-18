variable "org_name" {
    type        = string
    description = "The name of the Okta organization."
}

variable "base_url" {
    type        = string
    description = "The base URL of the Okta API."
}

variable "client_id" {
    type        = string
    description = "The client ID for the Okta application."
}

variable "scopes" {
    type        = list(string)
    description = "The list of scopes required for the Okta application."
}

variable "private_key" {
    type        = string
    description = "The private key used for authentication with the Okta API."
}

variable "app_name" {
    type        = string
    description = "The name of the Okta application."
}

variable "callback_url" {
    type        = string
    description = "The callback URL for the Okta application."
}

variable "login_url" {
    type        = string
    description = "The login URL for the Okta application."
}