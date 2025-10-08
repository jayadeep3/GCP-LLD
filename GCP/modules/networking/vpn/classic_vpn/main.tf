# Classic VPN Gateway
resource "google_compute_vpn_gateway" "classic_gateways" {
  for_each = var.vpns

  name    = each.value.gateway_name
  network = each.value.network
  region  = each.value.region
  project = var.project_id
}

# Classic VPN Tunnel
resource "google_compute_vpn_tunnel" "classic_tunnels" {
  for_each = var.vpn_tunnels

  name          = each.value.tunnel_name
  region        = each.value.region
  project       = var.project_id
  vpn_gateway   = google_compute_vpn_gateway.classic_gateways[each.value.gateway].id
  peer_ip       = each.value.peer_ip
  shared_secret = each.value.shared_secret
  ike_version   = try(each.value.ike_version, 2)

  depends_on = [google_compute_vpn_gateway.classic_gateways]
}
