

variable "log_bucket_name" {
  type = string
}

variable "log_bucket_location" {
  type = string
}

variable "project_id" {
  description = "The project ID."
  type        = string
  default     = ""
}

variable "region" {
  type = string
}

variable "log_export_sinks" {
  description = "The details of the log export sinks."
  type = map(object({
    parent_resource_id  = string,
    log_sink_name = string,
    log_bucket_project  = string,
    log_bucket_name     = string,
    log_bucket_location = string,
    filter              = string,
    description         = string,
    include_children    = bool,
    topic_name          = string
    # folder_name         = string
  }))
}

variable "labels" {
  type = map(string)
}

variable "topic_name" {
  type = string
}

variable "subscription_name" {
  type = string
}
variable "pub_sub_labels" {
  type = map(string)
}

variable "iam_bindings" {
  description = "IAM bindings for GCS and Pub/Sub"
  type = map(object({
    roles            = list(string)
    service_accounts = list(string)
  }))
}