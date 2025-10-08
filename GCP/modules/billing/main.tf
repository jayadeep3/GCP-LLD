resource "google_bigquery_dataset" "billing_export" {
  for_each      = var.datasets

  project       = var.central_billing_project
  dataset_id    = each.key
  friendly_name = each.value.friendly_name
  description   = each.value.description
  location      = var.billing_dataset_location
  labels        = each.value.labels
}
