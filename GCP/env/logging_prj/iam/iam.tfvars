
project_id = "ndf-logging-prj-mec2-01"
region = "me-central-2"

service_accounts = {
  svc_logging_prod = {
    project_id = "ndf-logging-prj-mec2-01"
    account_id = "svc-logging-prod"
    display_name = "SVC Logging Prod"
    description = "Writers for Cloud Logging/Monitoring in prod"
    roles = [
      "roles/logging.logWriter",
      "roles/monitoring.metricWriter",
      "roles/logging.viewer",
      "roles/monitoring.viewer"
    ]
}
}