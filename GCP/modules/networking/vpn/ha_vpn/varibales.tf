variable "project_id" {
  description = "Project where HA VPN will be created"
  type        = string
}

variable "ha_vpns" {
  description = "Map of HA VPN gateways"
  type = map(object({
    gateway_name = string
    network      = string
    region       = string
  }))
}

variable "ha_vpn_tunnels" {
  description = "Map of HA VPN tunnels"
  type = map(object({
    tunnel_name   = string
    region        = string
    gateway       = string   # Reference to ha_vpns key
    interface     = number   # 0 or 1
    peer_ip       = string
    shared_secret = string
    ike_version   = optional(number)
    router        = string   # Router name
  }))
}
