provider "tfe" {
  version = "=0.14.0"
  token   = var.token
}

resource "tfe_variable" "gcp_credentials" {
  for_each     = var.gcp_workspaces
  key          = "GOOGLE_CREDENTIALS"
  value        = var.gcp_credentials
  category     = "env"
  sensitive    = true
  workspace_id = "${var.organization}/${each.value}"
}

resource "tfe_variable" "aws_secret_access_key" {
  for_each     = var.aws_workspaces
  key          = "AWS_SECRET_ACCESS_KEY"
  value        = var.aws_secret_access_key
  category     = "env"
  sensitive    = true
  workspace_id = "${var.organization}/${each.value}"
}

resource "tfe_variable" "aws_access_key_id" {
  for_each     = var.aws_workspaces
  key          = "AWS_ACCESS_KEY_ID"
  value        = var.aws_access_key_id
  category     = "env"
  sensitive    = false
  workspace_id = "${var.organization}/${each.value}"
}

resource "tfe_variable" "arm_subscription_id" {
  for_each     = var.azure_workspaces
  key          = "ARM_SUBSCRIPTION_ID"
  value        = var.arm_subscription_id
  category     = "env"
  sensitive    = false
  workspace_id = "${var.organization}/${each.value}"
}

resource "tfe_variable" "arm_client_secret" {
  for_each     = var.azure_workspaces
  key          = "ARM_CLIENT_SECRET"
  value        = var.arm_client_secret
  category     = "env"
  sensitive    = true
  workspace_id = "${var.organization}/${each.value}"
}

resource "tfe_variable" "arm_tenant_id" {
  for_each     = var.azure_workspaces
  key          = "ARM_TENANT_ID"
  value        = var.arm_tenant_id
  category     = "env"
  sensitive    = false
  workspace_id = "${var.organization}/${each.value}"
}

resource "tfe_variable" "arm_client_id" {
  for_each     = var.azure_workspaces
  key          = "ARM_CLIENT_ID"
  value        = var.arm_client_id
  category     = "env"
  sensitive    = false
  workspace_id = "${var.organization}/${each.value}"
}

resource "tfe_variable" "env_vars_aws" {
  for_each     = var.aws_workspaces
  key          = "CONFIRM_DESTROY"
  value        = "1"
  category     = "env"
  workspace_id = "${var.organization}/${each.value}"
}

resource "tfe_variable" "env_vars_azure" {
  for_each     = var.azure_workspaces
  key          = "CONFIRM_DESTROY"
  value        = "1"
  category     = "env"
  workspace_id = "${var.organization}/${each.value}"
}

resource "tfe_variable" "env_vars_gcp" {
  for_each     = var.gcp_workspaces
  key          = "CONFIRM_DESTROY"
  value        = "1"
  category     = "env"
  workspace_id = "${var.organization}/${each.value}"
}
