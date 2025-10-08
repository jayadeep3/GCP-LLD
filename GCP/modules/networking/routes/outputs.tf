output "route_names" {
  description = "List of all route names created"
  value       = [for r in google_compute_route.routes : r.name]
}

output "route_self_links" {
  description = "List of self-links of all routes"
  value       = [for r in google_compute_route.routes : r.self_link]
}

# output "routes" {
#   # Output a list of route names from the 'google_compute_route.ro' resource
#   value = [for r in google_compute_route.ro : r.name]
# }

