variable "project_id" {
  type = string
}

variable "monitored_projects" {
  type        = list(string)
  description = "List of project IDs to attach to the monitoring workspace"
}

variable "notification_channels" {
  description = "Map: name => { type, labels }"
  type = map(object({
    type   = string
    labels = map(string)
  }))
  default = {}
}

variable "alert_policies" {
  description = "Map of alert policies"
  type = map(object({
    display_name  = string
    metric_type   = string
    resource_type = string
    threshold     = number
    duration      = optional(string, "60s")
    aligner       = optional(string, "ALIGN_MEAN")
    combiner      = optional(string, "OR")
    metric_labels = optional(map(string), {})
    user_labels   = optional(map(string))
  }))
  default = {}
}

# variable "labels" {
#   type = map(string)
# }