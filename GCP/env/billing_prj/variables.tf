variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "central_billing_project" {
  description = "Centralized project where billing datasets will be created"
  type        = string
}

variable "billing_dataset_location" {
  description = "Location of the billing datasets"
  type        = string
}

variable "datasets" {
  description = "Datasets to create in the centralized billing project (dataset_id → {friendly_name, description, labels})"
  type = map(object({
    friendly_name = string
    description   = string
    labels        = map(string)
  }))
}