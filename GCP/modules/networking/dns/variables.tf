
variable "project_id" {
  type        = string
  description = "GCP project ID where DNS zones and records are created"
}

variable "managed_zones" {
  type = map(object({
    name        = string
    dns_name    = string
    description = optional(string)
    visibility  = optional(string)  # public or private
    labels      = optional(map(string))
  }))
}

variable "records" {
  type = map(object({
    name         = string
    type         = string
    ttl          = number
    managed_zone = string
    rrdatas      = list(string)
  }))
}