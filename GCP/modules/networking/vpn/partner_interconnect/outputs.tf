output "partner_interconnect_attachment_ids" {
  description = "IDs of Partner Interconnect VLAN attachments"
  value       = { for k, v in google_compute_interconnect_attachment.partner_attachments : k => v.id }
}

output "partner_interconnect_attachment_names" {
  description = "Names of Partner Interconnect VLAN attachments"
  value       = { for k, v in google_compute_interconnect_attachment.partner_attachments : k => v.name }
}
