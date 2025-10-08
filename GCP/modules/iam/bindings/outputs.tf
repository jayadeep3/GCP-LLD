
output "iam_bindings" {
  description = "IAM bindings applied to resources"
  value = google_project_iam_binding.bindings
}