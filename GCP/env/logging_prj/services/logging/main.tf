module "log_export_sinks" {
  source = "../../../../modules/logging"
  project_id          = var.project_id
  log_bucket_name     = var.log_bucket_name
  log_bucket_location = var.log_bucket_location
  log_export_sinks    = var.log_export_sinks
  labels              = var.labels
  topic_name          = var.topic_name
  subscription_name   = var.subscription_name
  pub_sub_labels      = var.pub_sub_labels
  iam_bindings        = var.iam_bindings
}
