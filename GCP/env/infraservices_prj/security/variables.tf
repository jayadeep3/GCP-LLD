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