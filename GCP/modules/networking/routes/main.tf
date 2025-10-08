resource "google_compute_route" "routes" {
  for_each = var.routes

  name        = each.value.name
  network     = each.value.network
  project     = var.project_id
  dest_range  = each.value.dest_range
  next_hop_ip = try(each.value.next_hop_ip, null)           # optional
  next_hop_ilb = try(each.value.next_hop_ilb, null)       # optional
  next_hop_gateway = try(each.value.next_hop_gateway, null)   # optional
  priority    = try(each.value.priority, 1000)
  description = try(each.value.description, "")
}
