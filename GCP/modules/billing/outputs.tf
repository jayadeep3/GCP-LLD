output "dataset_ids" {
  description = "List of dataset IDs created"
  value       = [for d in google_bigquery_dataset.billing_export : d.dataset_id]
}

output "dataset_full_names" {
  description = "Full dataset names in project.dataset_id format"
  value       = [for d in google_bigquery_dataset.billing_export : "${d.project}.${d.dataset_id}"]
}