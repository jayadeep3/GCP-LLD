resource "google_compute_network_peering" "hub_to_spoke" {
  for_each = var.spokes
  name                 = "hub-to-${each.key}"
  network              = "projects/${var.hub_project_id}/global/networks/${var.hub_vpc_name}"
  peer_network         = "projects/${each.value.project_id}/global/networks/${each.value.vpc_name}"
  export_custom_routes = true
  import_custom_routes = true
}

resource "google_compute_network_peering" "spoke_to_hub" {
  for_each = var.spokes
  name                 = "${each.key}-to-hub"
  network              = "projects/${each.value.project_id}/global/networks/${each.value.vpc_name}"
  peer_network         = "projects/${var.hub_project_id}/global/networks/${var.hub_vpc_name}"
  export_custom_routes = true
  import_custom_routes = true
}
