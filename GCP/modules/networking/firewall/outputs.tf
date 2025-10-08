output "firewall_rule_names" {
  value = [for f in google_compute_firewall.rules : f.name]
}