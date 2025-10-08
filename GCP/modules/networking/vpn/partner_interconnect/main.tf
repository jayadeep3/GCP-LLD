# VLAN Attachment (Partner Interconnect)
resource "google_compute_interconnect_attachment" "partner_attachments" {
  for_each = var.partner_interconnects

  name         = each.value.name
  region       = each.value.region
  project      = var.project_id
  router       = each.value.router        # must be an existing Cloud Router
  type         = "PARTNER"
  edge_availability_domain = each.value.edge_availability_domain  # AVAILABILITY_DOMAIN_1 or AVAILABILITY_DOMAIN_2
  bandwidth    = each.value.bandwidth     # e.g., "BPS_50M", "BPS_100M"
  vlan_tag8021q = try(each.value.vlan_tag8021q, null)

  # Optional
  admin_enabled = try(each.value.admin_enabled, true)
  description   = try(each.value.description, "")
}
