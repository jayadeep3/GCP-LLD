variable "project_id" {
  type = string
}

variable "region" {
  type    = string
}

variable "vpcs" {
  type = map(object({
    vpc_name     = string
    routing_mode = string
  }))
}

variable "subnets" {
  type = map(object({
    subnet_name              = string
    region                   = string
    ip_cidr_range            = string
    network                  = string   
    private_ip_google_access = optional(bool)
  }))
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



variable "routes" {
  type = map(object({
    name             = string
    network          = string
    dest_range       = string
    next_hop_ilb     = optional(string)
    next_hop_ip      = optional(string)
    next_hop_gateway = optional(string)
    priority         = optional(number)
    description      = optional(string)
  }))
}

/*
variable "routers" {
  type = map(object({
    name    = string
    network = string
    region  = string
  }))
}



variable "nats" {
  type = map(object({
    name                             = string
    router                           = string
    region                           = string
    nat_ip_allocate_option           = string
    source_subnetwork_ip_ranges_to_nat = string
  }))
}


variable "vpns" {
  type = map(object({
    gateway_name = string
    network      = string
    region       = string
  }))
}

variable "vpn_tunnels" {
  type = map(object({
    tunnel_name   = string
    region        = string
    gateway       = string
    peer_ip       = string
    shared_secret = string
    ike_version   = optional(number)
  }))
}

variable "ha_vpns" {
  type = map(object({
    gateway_name = string
    network      = string
    region       = string
  }))
}

variable "ha_vpn_tunnels" {
  type = map(object({
    tunnel_name   = string
    region        = string
    gateway       = string
    interface     = number
    peer_ip       = string
    shared_secret = string
    ike_version   = optional(number)
    router        = string
  }))
}

variable "partner_interconnects" {
  type = map(object({
    name                      = string
    region                    = string
    router                    = string
    edge_availability_domain  = string
    bandwidth                 = string
    vlan_tag8021q             = optional(number)
    admin_enabled             = optional(bool)
    description               = optional(string)
  }))
}



variable "managed_zones" {
  type = map(object({
    name        = string
    dns_name    = string
    description = optional(string)
    visibility  = optional(string)
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
*/

# variable "internal_lbs" {
#   type = map(object({
#     name       = string
#     region     = string
#     network    = string
#     subnetwork = string
#     ip_address = string
#   }))
# }