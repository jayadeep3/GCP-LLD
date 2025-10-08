resource "google_compute_health_check" "default" {
  name                = "${var.name}-hc"
  project             = var.project_id
  tcp_health_check {
    port = 80
  }
}

resource "google_compute_region_backend_service" "default" {
  name                  = "${var.name}-backend"
  project               = var.project_id
  region                = var.region
  protocol              = "TCP"
  health_checks         = [google_compute_health_check.default.self_link]
  load_balancing_scheme = "INTERNAL"
}

resource "google_compute_forwarding_rule" "default" {
  name                  = var.name
  project               = var.project_id
  region                = var.region
  load_balancing_scheme = "INTERNAL"
  ip_address            = var.ip_address
  ports                 = ["80"]
  backend_service       = google_compute_region_backend_service.default.self_link
  network               = var.network
  subnetwork            = var.subnetwork
  labels                = var.labels
}
