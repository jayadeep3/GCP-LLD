# ----------------------------------------------------------------------
# Billing Project
# ----------------------------------------------------------------------
module "billing_project" {
  source          = "../../modules/projects"
  project_id      = "ndf-billing-prj-mec2-01"
  name            = "ndf-billing-prj-mec2-0"
  folder_id       = var.folder_id_sharedservices
  billing_account = var.billing_account_id
  labels          = var.default_labels
}

# ----------------------------------------------------------------------
# Networking Project
# ----------------------------------------------------------------------
module "network_project" {
  source          = "../../modules/projects"
  project_id      = "ndf-network-prj-mec2-01"
  name            = "ndf-network-prj-mec2-0"
  folder_id       = var.folder_id_network
  billing_account = var.billing_account_id
  labels          = var.default_labels
}

# ----------------------------------------------------------------------
# Logging Project
# ----------------------------------------------------------------------
module "logging_project" {
  source          = "../../modules/projects"
  project_id      = "ndf-logging-prj-mec2-01"
  name            = "ndf-logging-prj-mec2-0"
  folder_id       = var.folder_id_sharedservices
  billing_account = var.billing_account_id
  labels          = var.default_labels
}

# ----------------------------------------------------------------------
# Iac Project
# ----------------------------------------------------------------------
module "iac_project" {
  source          = "../../modules/projects"
  project_id      = "ndf-iac-prj-mec2-01"
  name            = "ndf-iac-prj-mec2-0"
  folder_id       = var.folder_id_sharedservices
  billing_account = var.billing_account_id
  labels          = var.default_labels
}

# ----------------------------------------------------------------------
# Security Project
# ----------------------------------------------------------------------
module "security_project" {
  source          = "../../modules/projects"
  project_id      = "ndf-security-prj-mec2-01" 
  name            = "ndf-security-prj-mec2-0"
  folder_id       = var.folder_id_security
  billing_account = var.billing_account_id
  labels          = var.default_labels
}

# ----------------------------------------------------------------------
# Sandbox Project
# ----------------------------------------------------------------------
module "sandbox_project" {
  source          = "../../modules/projects"
  project_id      = "ndf-sbx-prj-mec2-01"
  name            = "ndf-sbx-prj-mec2-0"
  folder_id       = var.folder_id_sbx
  billing_account = var.billing_account_id
  labels          = var.default_labels
}

# ----------------------------------------------------------------------
# Platform Workloads Projects
# ----------------------------------------------------------------------
module "prod_project" {
  source          = "../../modules/projects"
  project_id      = "ndf-prod-prj-mec2-01" #we were not getting the project id same as the project name for this one that's why we are using a google generated one
  name            = "ndf-prod-prj-mec2-0"
  folder_id       = var.folder_id_prod
  billing_account = var.billing_account_id
  labels          = var.default_labels
}

module "preprod_project" {
  source          = "../../modules/projects"
  project_id      = "ndf-pp-prj-mec2-01"
  name            = "ndf-pp-prj-mec2-0"
  folder_id       = var.folder_id_pp
  billing_account = var.billing_account_id
  labels          = var.default_labels
}

module "dev_project" {
  source          = "../../modules/projects"
  project_id      = "ndf-dev-prj-mec2-01"
  name            = "ndf-dev-prj-mec2-0"
  folder_id       = var.folder_id_dev
  billing_account = var.billing_account_id
  labels          = var.default_labels
}

module "infra_project" {
  source          = "../../modules/projects"
  project_id      = "ndf-infraservices-prj-mec2-01"
  name            = "ndf-infraservices-prj-mec2-0"
  folder_id       = var.folder_id_infra
  billing_account = var.billing_account_id
  labels          = var.default_labels
}
