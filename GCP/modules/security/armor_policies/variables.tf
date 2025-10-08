variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "policy_name" {
  description = "Cloud Armor policy name"
  type        = string
}

variable "policy_description" {
  description = "Description of the policy"
  type        = string
  default     = "Cloud Armor Security Policy"
}

variable "rules" {
  description = "List of Cloud Armor rules"
  type = list(object({
    action         = string
    priority       = number
    versioned_expr = string
    src_ip_ranges  = list(string)
    description    = optional(string)
  }))
}

variable "default_rule_action" {
  description = "Action for the default rule (must be allow or deny(403))"
  type        = string
  default     = "deny(403)"
}

variable "backends" {
  description = "Backend services to attach Cloud Armor policy"
  type = map(object({
    name        = string
    protocol    = optional(string)
    scheme      = optional(string)
    port_name   = optional(string)
    timeout_sec = optional(number)
  }))
}

variable "labels" {
  description = "Common labels for all resources"
  type = map(string)
}