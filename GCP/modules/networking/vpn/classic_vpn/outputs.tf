output "vpn_gateway_names" {
  description = "Names of Classic VPN Gateways"
  value       = { for k, v in google_compute_vpn_gateway.classic_gateways : k => v.name }
}

output "vpn_tunnel_names" {
  description = "Names of Classic VPN Tunnels"
  value       = { for k, v in google_compute_vpn_tunnel.classic_tunnels : k => v.name }
}
