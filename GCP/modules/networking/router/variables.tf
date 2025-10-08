variable "project_id" {
  type        = string
  description = "GCP project ID where routers will be created"
}

variable "routers" {
  type = map(object({
    name     = string
    region   = string
    network  = string
  }))
}

