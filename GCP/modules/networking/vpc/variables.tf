variable "project_id" {
  type = string
}

variable "vpcs" {
  type = map(object({
    vpc_name     = string
    routing_mode = string
  }))
}
