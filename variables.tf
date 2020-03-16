variable "token" {
}

variable "oauth_token_id" {
}

variable "organization" {
}

variable "aws_workspace_ids" {
  type    = set(string)
  default = []
}

variable "azure_workspace_ids" {
  type    = set(string)
  default = []
}

variable "gcp_workspace_ids" {
  type    = set(string)
  default = []
}

variable "gcp_credentials" {
}

variable "aws_secret_access_key" {
}

variable "aws_access_key_id" {
}

variable "arm_subscription_id" {
}

variable "arm_client_secret" {
}

variable "arm_tenant_id" {
}

variable "arm_client_id" {
}

