resource "google_compute_interconnect_attachment" "this" {
  name                     = var.name
  # edge_availability_domain = var.edge_availability_domain
  type                     = var.type
  router                   = var.router
  mtu                      = var.mtu
  labels                   = var.labels
}
