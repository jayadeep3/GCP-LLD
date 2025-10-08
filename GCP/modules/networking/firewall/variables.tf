variable "project_id" {
  type        = string
  description = "GCP project ID where routers will be created"
}
variable "firewall_rules" {
  description = "Map of firewall rules"
  type = map(object({
    name               = string
    network            = string
    direction          = string
    action             = string               
    protocol           = string
    ports              = optional(list(string))
    source_ranges      = optional(list(string))
    destination_ranges = optional(list(string))
    target_tags        = optional(list(string))
    priority           = optional(number, 1000)
    disabled           = optional(bool, false)
    description        = optional(string)
  }))
}