output "cloud_armor_policy_name" {
  value = google_compute_security_policy.policy.name
}

output "attached_backends" {
  value = [for b in google_compute_backend_service.backend_service : b.name]
}