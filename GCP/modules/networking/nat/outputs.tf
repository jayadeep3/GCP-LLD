output "nat_names" {
  description = "List of NAT names"
  value       = [for n in google_compute_router_nat.nats : n.name]
}
