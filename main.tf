provider "tfe" {
  token = var.token
}

# data "tfe_workspace_ids" "aws_workspaces" {
#   names        = var.aws_workspaces
#   organization = var.organization
# }

data "tfe_workspace_ids" "azure_workspaces" {
  names        = var.azure_workspaces
  organization = var.organization
}

# data "tfe_workspace_ids" "gcp_workspaces" {
#   names        = var.gcp_workspaces
#   organization = var.organization
# }

# resource "tfe_variable" "aws_access_key_id" {
#   for_each     = data.tfe_workspace_ids.aws_workspaces.ids
#   key          = "AWS_ACCESS_KEY_ID"
#   value        = var.aws_access_key_id
#   category     = "env"
#   sensitive    = false
#   workspace_id = each.value
# }

# resource "tfe_variable" "aws_secret_access_key" {
#   for_each     = data.tfe_workspace_ids.aws_workspaces.ids
#   key          = "AWS_SECRET_ACCESS_KEY"
#   value        = var.aws_secret_access_key
#   category     = "env"
#   sensitive    = true
#   workspace_id = each.value
# }

resource "tfe_variable" "arm_client_id" {
  for_each     = data.tfe_workspace_ids.azure_workspaces.ids
  key          = "ARM_CLIENT_ID"
  value        = var.arm_client_id
  category     = "env"
  sensitive    = false
  workspace_id = each.value
}

resource "tfe_variable" "arm_client_secret" {
  for_each     = data.tfe_workspace_ids.azure_workspaces.ids
  key          = "ARM_CLIENT_SECRET"
  value        = var.arm_client_secret
  category     = "env"
  sensitive    = true
  workspace_id = each.value
}

resource "tfe_variable" "arm_subscription_id" {
  for_each     = data.tfe_workspace_ids.azure_workspaces.ids
  key          = "ARM_SUBSCRIPTION_ID"
  value        = var.arm_subscription_id
  category     = "env"
  sensitive    = false
  workspace_id = each.value
}

resource "tfe_variable" "arm_tenant_id" {
  for_each     = data.tfe_workspace_ids.azure_workspaces.ids
  key          = "ARM_TENANT_ID"
  value        = var.arm_tenant_id
  category     = "env"
  sensitive    = false
  workspace_id = each.value
}

# resource "tfe_variable" "gcp_credentials" {
#   for_each     = data.tfe_workspace_ids.gcp_workspaces.ids
#   key          = "GOOGLE_CREDENTIALS"
#   value        = var.gcp_credentials
#   category     = "env"
#   sensitive    = true
#   workspace_id = each.value
# }
