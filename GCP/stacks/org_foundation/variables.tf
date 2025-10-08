
variable "org_id" {
  description = "Organization ID"
  type        = string
  default = "28552764765"
}

variable "folder_id_sharedservices" {
  description = "Folder ID from sharedservices"
  type        = string
  default = "folders/1074937847558"
}

variable "folder_id_network" {
  description = "Folder ID from network"
  type        = string
  default = "folders/162494102803"
}


variable "folder_id_security" {
  description = "Folder ID from security"
  type        = string
  default = "folders/956689357329"
}

variable "folder_id_sbx" {
  description = "Folder ID from sbx"
  type        = string
  default = "folders/707491108860"
}

variable "folder_id_prod" {
  description = "Folder ID from prod"
  type        = string
  default = "folders/149596284825"
}

variable "folder_id_pp" {
  description = "Folder ID from pre-prod"
  type        = string
  default = "folders/85737518767"
}

variable "folder_id_dev" {
  description = "Folder ID from dev"
  type        = string
  default = "folders/382113928519"
}

variable "folder_id_infra" {
  description = "Folder ID from infra"
  type        = string
  default = "folders/269348856312"
}

variable "billing_account_id" {
  description = "Billing account ID"
  type        = string
  
}

variable "bootstrap_project_id" {
  description = "Bootstrap project ID used for provider auth"
  type        = string
}

variable "default_region" {
  description = "Default region for resources"
  type        = string
  default     = "me-central2"
}

variable "default_labels" {
  description = "Default labels applied to all projects"
  type        = map(string)
  default     = {} # will be overridden by global/labels.tf
}

# variable "projects" {
#   description = "Map of projects keyed by project_id; see modules/project for schema."
#   type = map(object({
#     name                = string
#     parent              = string
#     billing             = string
#     labels              = optional(map(string), {})
#     apis                = optional(list(string), [])
#     auto_create_network = optional(bool, false)
#     skip_delete         = optional(bool, false)
#   }))
#   default = {}
# }