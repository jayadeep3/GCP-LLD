
output "folder_ids" {
  description = "Map of created folder resource names."
  value       = { for k, v in google_folder.this : k => v.name }
}