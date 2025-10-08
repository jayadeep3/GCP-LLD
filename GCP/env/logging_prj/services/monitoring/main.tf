module "monitoring" {
  source                 = "../../../../modules/monitoring"
  monitored_projects     = var.monitored_projects
  project_id             = var.project_id
  notification_channels  = var.notif_channels
  alert_policies         = var.alert_policies
  # user_labels            = var.user_labels
}
