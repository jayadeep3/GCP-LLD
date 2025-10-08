variable "project_id" {
  description = "Project where Partner Interconnect will be created"
  type        = string
}

variable "partner_interconnects" {
  description = "Map of Partner Interconnect VLAN attachments"
  type = map(object({
    name                      = string
    region                    = string
    router                    = string
    edge_availability_domain  = string   # AVAILABILITY_DOMAIN_1 or AVAILABILITY_DOMAIN_2
    bandwidth                 = string   # BPS_50M, BPS_100M, BPS_200M, etc.
    vlan_tag8021q             = optional(number)
    admin_enabled             = optional(bool)
    description               = optional(string)
  }))
}
