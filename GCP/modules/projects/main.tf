resource "google_project" "this" {
  project_id      = var.project_id
  name            = var.name
  billing_account = var.billing_account
  folder_id       = var.folder_id   # ensure this is passed
  labels          = var.labels
}

# Enable services
resource "google_project_service" "services" {
  for_each           = toset(var.activate_apis)
  project            = google_project.this.project_id
  service            = each.value
  disable_on_destroy = false
}
