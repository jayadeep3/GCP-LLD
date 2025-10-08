# ----------------------------------------------------------------------
# Billing Project
# ----------------------------------------------------------------------
module "billing_project" {
  source          = "../../modules/projects"
  project_id      = "test-billing-prj-mec2-01"
  name            = "test-billing-prj-mec2-0"
  folder_id       = var.folder_id_sharedservices
  billing_account = var.billing_account_id
  labels          = var.default_labels
}

# ----------------------------------------------------------------------
# Networking Project
# ----------------------------------------------------------------------
module "network_project" {
  source          = "../../modules/projects"
  project_id      = "test-network-prj-mec2-01"
  name            = "test-network-prj-mec2-0"
  folder_id       = var.folder_id_network
  billing_account = var.billing_account_id
  labels          = var.default_labels
}

# ----------------------------------------------------------------------
# Logging Project
# ----------------------------------------------------------------------
module "logging_project" {
  source          = "../../modules/projects"
  project_id      = "test-logging-prj-mec2-01"
  name            = "test-logging-prj-mec2-0"
  folder_id       = var.folder_id_sharedservices
  billing_account = var.billing_account_id
  labels          = var.default_labels
}

# ----------------------------------------------------------------------
# Iac Project
# ----------------------------------------------------------------------
module "iac_project" {
  source          = "../../modules/projects"
  project_id      = "test-iac-prj-mec2-01"
  name            = "test-iac-prj-mec2-0"
  folder_id       = var.folder_id_sharedservices
  billing_account = var.billing_account_id
  labels          = var.default_labels
}

# ----------------------------------------------------------------------
# Security Project
# ----------------------------------------------------------------------
module "security_project" {
  source          = "../../modules/projects"
  project_id      = "test-security-prj-mec2-01" 
  name            = "test-security-prj-mec2-0"
  folder_id       = var.folder_id_security
  billing_account = var.billing_account_id
  labels          = var.default_labels
}

# ----------------------------------------------------------------------
# Sandbox Project
# ----------------------------------------------------------------------
module "sandbox_project" {
  source          = "../../modules/projects"
  project_id      = "test-sbx-prj-mec2-01"
  name            = "test-sbx-prj-mec2-0"
  folder_id       = var.folder_id_sbx
  billing_account = var.billing_account_id
  labels          = var.default_labels
}

# ----------------------------------------------------------------------
# Platform Workloads Projects
# ----------------------------------------------------------------------
module "prod_project" {
  source          = "../../modules/projects"
  project_id      = "test-prod-prj-mec2-01" #we were not getting the project id same as the project name for this one that's why we are using a google generated one
  name            = "test-prod-prj-mec2-0"
  folder_id       = var.folder_id_prod
  billing_account = var.billing_account_id
  labels          = var.default_labels
}

module "preprod_project" {
  source          = "../../modules/projects"
  project_id      = "test-pp-prj-mec2-01"
  name            = "test-pp-prj-mec2-0"
  folder_id       = var.folder_id_pp
  billing_account = var.billing_account_id
  labels          = var.default_labels
}

module "dev_project" {
  source          = "../../modules/projects"
  project_id      = "test-dev-prj-mec2-01"
  name            = "test-dev-prj-mec2-0"
  folder_id       = var.folder_id_dev
  billing_account = var.billing_account_id
  labels          = var.default_labels
}

module "infra_project" {
  source          = "../../modules/projects"
  project_id      = "test-infraservices-prj-mec2-01"
  name            = "test-infraservices-prj-mec2-0"
  folder_id       = var.folder_id_infra
  billing_account = var.billing_account_id
  labels          = var.default_labels
}
