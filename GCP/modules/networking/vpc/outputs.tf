
output "vpc_self_links" {
  description = "Self links of VPCs, keyed by name"
  value = { for k, v in google_compute_network.vpc : v.name => v.self_link }
}
