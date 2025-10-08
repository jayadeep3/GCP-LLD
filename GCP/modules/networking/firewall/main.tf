resource "google_compute_firewall" "rules" {
  for_each = var.firewall_rules
  name    = each.value.name
  network = each.value.network
  direction   = each.value.direction
  priority    = lookup(each.value, "priority", 1000)
  disabled    = lookup(each.value, "disabled", false)
  description = lookup(each.value, "description", null)
  # Allow rules
  dynamic "allow" {
    for_each = lookup(each.value, "action", "allow") == "allow" ? [1] : []
    content {
      protocol = each.value.protocol
      ports    = lookup(each.value, "ports", null)
    }
  }
  # Deny rules
  dynamic "deny" {
    for_each = lookup(each.value, "action", "allow") == "deny" ? [1] : []
    content {
      protocol = each.value.protocol
      ports    = lookup(each.value, "ports", null)
    }
  }
  source_ranges      = lookup(each.value, "source_ranges", null)
  destination_ranges = lookup(each.value, "destination_ranges", null)
  target_tags        = lookup(each.value, "target_tags", null)
}
