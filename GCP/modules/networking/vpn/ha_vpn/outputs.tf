output "ha_vpn_gateway_ids" {
  description = "IDs of HA VPN gateways"
  value       = { for k, v in google_compute_ha_vpn_gateway.ha_gateways : k => v.id }
}

output "ha_vpn_tunnel_names" {
  description = "Names of HA VPN tunnels"
  value       = { for k, v in google_compute_vpn_tunnel.ha_tunnels : k => v.name }
}
