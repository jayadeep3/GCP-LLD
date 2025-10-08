
variable "project_id" {
  type = string
  
}

variable "log_bucket_name" {
  type = string
}

variable "log_bucket_location" {
  type = string
}

variable "labels" {
  type = map(string)
}

variable "log_export_sinks" {
  description = "The details of the log export sinks. Each sink maps to one folder in the centralized log bucket."
  type = map(object({
    parent_resource_id  = string, # Folder or Org ID where sink is created
    log_sink_name       = string, # Name of the sink
    topic_name          = string
    log_bucket_project  = string, # Project where log bucket is created
    log_bucket_name     = string, # Centralized log bucket name
    log_bucket_location = string, # Centralized log bucket location
    filter              = string, # Log filter (can be empty string)
    description         = string, # Description for the sink
    include_children    = bool,   # Whether to include child projects/folders
    # folder_name         = string  # Folder prefix inside the centralized bucket
  }))
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
 