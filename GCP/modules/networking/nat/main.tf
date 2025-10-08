resource "google_compute_router_nat" "nats" {
  for_each = var.nats

  name   = each.value.name
  router = each.value.router        # must be the router name created in routers module
  project = var.project_id
  region  = each.value.region

  nat_ip_allocate_option              = each.value.nat_ip_allocate_option
  source_subnetwork_ip_ranges_to_nat = each.value.source_subnetwork_ip_ranges_to_nat
}
