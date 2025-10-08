variable "project_id" {
  description = "Project where Classic VPN will be created"
  type        = string
}

variable "vpns" {
  description = "Map of Classic VPN gateways"
  type = map(object({
    gateway_name = string
    network      = string
    region       = string
  }))
}

variable "vpn_tunnels" {
  description = "Map of Classic VPN tunnels"
  type = map(object({
    tunnel_name   = string
    region        = string
    gateway       = string  # must match key in vpns map
    peer_ip       = string
    shared_secret = string
    ike_version   = optional(number)
  }))
}
