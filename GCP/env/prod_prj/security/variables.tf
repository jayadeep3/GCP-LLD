variable "kms_environments" {
  description = "Map of environment configurations for KMS keys"
  type = map(object({
    region           = string
    key_ring         = string
    key_name         = string
    algorithm        = string
    protection_level = string
    labels           = map(string)
    rotation_days    = number
    # iam_bindings     = list(object({
    #   role   = string
    #   member = string
    # }))
  }))
}

variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

# variable "policy_name" {
#   type = string
# }

# variable "policy_description" {
#   type    = string
#   default = "Cloud Armor Policy"
# }

# variable "rules" {
#   type = list(any)
# }

# variable "default_rule_action" {
#   type    = string
#   default = "deny(403)"
# }

# variable "backends" {
#   type = map(any)
# }

# variable "labels" {
#   description = "Common labels for all resources"
#   type = map(string)
# }