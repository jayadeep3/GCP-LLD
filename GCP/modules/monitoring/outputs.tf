
output "alert_policy_names" {
  description = "List of alert policies created"
  value       = [for k, ap in google_monitoring_alert_policy.ap : ap.display_name]
}

output "channels" { value = [for c in google_monitoring_notification_channel.ch : c.display_name] }

output "monitored_projects" {
  value = [for p in google_monitoring_monitored_project.monitored : p.name]
}