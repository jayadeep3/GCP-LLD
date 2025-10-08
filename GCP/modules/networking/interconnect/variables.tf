
variable "name" {
  description = "Name of the interconnect attachment"
  type        = string
}

# variable "edge_availability_domain" {
#   description = "Availability domain for the interconnect attachment"
#   type        = string
# }

variable "type" {
  description = "Type of interconnect attachment (PARTNER, DEDICATED, etc.)"
  type        = string
  default     = "PARTNER"
}

variable "router" {
  description = "ID of the Cloud Router"
  type        = string
}

variable "mtu" {
  description = "Maximum Transmission Unit (MTU) in bytes"
  type        = number
  default     = 1500
}

variable "labels" {
  description = "Labels to apply to the resource"
  type        = map(string)
  default     = {}
}
