# HA VPN Gateway
resource "google_compute_ha_vpn_gateway" "ha_gateways" {
  for_each = var.ha_vpns

  name    = each.value.gateway_name
  network = each.value.network
  region  = each.value.region
  project = var.project_id
}

# HA VPN Tunnels
resource "google_compute_vpn_tunnel" "ha_tunnels" {
  for_each = var.ha_vpn_tunnels

  name               = each.value.tunnel_name
  region             = each.value.region
  project            = var.project_id
  vpn_gateway        = google_compute_ha_vpn_gateway.ha_gateways[each.value.gateway].id
  vpn_gateway_interface = each.value.interface     # 0 or 1
  peer_ip            = each.value.peer_ip
  shared_secret      = each.value.shared_secret
  ike_version        = try(each.value.ike_version, 2)

  router             = each.value.router          # Router is required for HA VPN

  depends_on = [
    google_compute_ha_vpn_gateway.ha_gateways
  ]
}
