
variable "project_id" {
  description = "The unique ID for the project"
  type        = string
}

variable "name" {
  description = "The display name for the project"
  type        = string
}

variable "billing_account" {
  description = "Billing account ID"
  type        = string
}

variable "folder_id" {
  description = "Folder ID to associate this project with"
  type        = string
}

variable "labels" {
  description = "Labels to apply"
  type        = map(string)
  default     = {}
}

variable "activate_apis" {
  description = "APIs to enable on the project"
  type        = list(string)
  default     = [
    "iam.googleapis.com",
    # "billing.googleapis.com",
    "serviceusage.googleapis.com",
    "compute.googleapis.com",
    "orgpolicy.googleapis.com",
    "cloudkms.googleapis.com",
    "storage.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com"

  ]
}