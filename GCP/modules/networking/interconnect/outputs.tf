
output "id" {
  description = "The ID of the interconnect attachment"
  value       = google_compute_interconnect_attachment.this.id
}

output "self_link" {
  description = "The self link of the interconnect attachment"
  value       = google_compute_interconnect_attachment.this.self_link
}

output "name" {
  description = "The name of the interconnect attachment"
  value       = google_compute_interconnect_attachment.this.name
}
