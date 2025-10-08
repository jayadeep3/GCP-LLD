output "hub_to_spoke_peering_names" {
  value = [for p in google_compute_network_peering.hub_to_spoke : p.name]
}

output "spoke_to_hub_peering_names" {
  value = [for p in google_compute_network_peering.spoke_to_hub : p.name]
}
