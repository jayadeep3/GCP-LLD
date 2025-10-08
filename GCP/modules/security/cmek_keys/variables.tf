


variable "project_id" {
  description = "The GCP project ID where KMS resources will be created."
  type        = string
}

variable "region" {
  description = "The region to create the KMS Key Ring."
  type        = string
  default     = "me-central2"
}

variable "key_ring_name" {
  description = "Name of the KMS key ring."
  type        = string
}

variable "key_name" {
  description = "Name of the crypto key."
  type        = string
}

variable "algorithm" {
  description = "The algorithm for the KMS key."
  type        = string
  default     = "GOOGLE_SYMMETRIC_ENCRYPTION"
}

variable "protection_level" {
  description = "Protection level of the KMS key."
  type        = string
  default     = "SOFTWARE"
}

variable "rotation_days" {
  description = "Rotation period in days"
  type        = number

  validation {
    condition     = var.rotation_days >= 1 && var.rotation_days <= 365
    error_message = "rotation_days must be between 1 and 365."
  }
}

# variable "iam_bindings" {
#   description = "List of IAM bindings for the KMS key. Each binding must include role and member."
#   type = list(object({
#     role   = string
#     member = string
#   }))
#   default = []
# }

variable "labels" {
  description = "Common labels for all resources"
  type = map(string)
}
