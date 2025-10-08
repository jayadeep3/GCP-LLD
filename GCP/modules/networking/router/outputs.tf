output "router_names" {
  description = "Names of the routers created"
  value       = { for k, r in google_compute_router.routers : k => r.name }
}

output "router_self_links" {
  description = "Self-links of the routers created"
  value       = { for k, r in google_compute_router.routers : k => r.self_link }
}
