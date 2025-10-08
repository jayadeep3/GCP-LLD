
project_id = "test-logging-prj-mec2-01"
region = "me-central2"
log_bucket_location = "me-central2"
log_bucket_name = "cb-logs-mec2-0"
labels        = {
  environment  = "test"
  owner        = "test-team"
  app          = "test"
  department   = "test"
  service_type = "storage"
}
/******************************************
 Log Export Sink Details
 *****************************************/
log_export_sinks = {
  log_export_sink_01 = {
    parent_resource_id  = "folders/162345678897"
    log_sink_name       = "networking-log-sink"
    topic_name          = "ps-topic-logging-mec2-0"
    log_bucket_project  = "test-logging-prj-mec2-01"
    log_bucket_name     = "cb-logs-mec2-0"
    log_bucket_location = "me-central2"
    description         = "Storage logs in centralized bucket for hub networking project."
    filter              = ""
    include_children    = true
    # folder_name         = "test-hub-networking-folder"
  }
  log_export_sink_02 = {
    parent_resource_id  = "folders/123456789012"
    log_sink_name       = "infraservices-log-sink"
    topic_name          = "ps-topic-logging-mec2-0"
    log_bucket_project  = "test-logging-prj-mec2-01"
    log_bucket_name     = "cb-logs-mec2-0"
    log_bucket_location = "me-central2"
    description         = "Storage logs in centralized bucket for infraservices project."
    filter              = ""
    include_children    = true
    # folder_name         = "test-infraservices-folder"
  }
  log_export_sink_03 = {
    parent_resource_id  = "folders/123456789012"
    log_sink_name       = "dev-log-sink"
    topic_name          = "ps-topic-logging-mec2-0"
    log_bucket_project  = "test-logging-prj-mec2-01"
    log_bucket_name     = "cb-logs-mec2-0"
    log_bucket_location = "me-central2"
    description         = "Storage logs in centralized bucket for dev project."
    filter              = ""
    include_children    = true
    # folder_name         = "test-dev-folder"
  }
  log_export_sink_04 = {
    parent_resource_id  = "folders/012345678912"
    log_sink_name       = "pp-log-sink"
    topic_name          = "ps-topic-logging-mec2-0"
    log_bucket_project  = "test-logging-prj-mec2-01"
    log_bucket_name     = "cb-logs-mec2-0"
    log_bucket_location = "me-central2"
    description         = "Storage logs in centralized bucket for preprod project."
    filter              = ""
    include_children    = true
    # folder_name         = "test-preprod-folder"
  }
  log_export_sink_05 = {
    parent_resource_id  = "folders/012345678901"
    log_sink_name       = "prod-log-sink"
    topic_name          = "ps-topic-logging-mec2-0"
    log_bucket_project  = "test-logging-prj-mec2-01"
    log_bucket_name     = "cb-logs-mec2-0"
    log_bucket_location = "me-central2"
    description         = "Storage logs in centralized bucket for prod project."
    filter              = ""
    include_children    = true
    # folder_name         = "test-prod-folder"
  }
  log_export_sink_06 = {
    parent_resource_id  = "folders/012345677891"
    log_sink_name       = "security-log-sink"
    topic_name          = "ps-topic-logging-mec2-0"
    log_bucket_project  = "test-logging-prj-mec2-01"
    log_bucket_name     = "cb-logs-mec2-0"
    log_bucket_location = "me-central2"
    description         = "Storage logs in centralized bucket for security project."
    filter              = ""
    include_children    = true
    # folder_name         = "test-security-folder"
  }

  log_export_sink_07 = {
    parent_resource_id  = "folders/0123456789012"
    log_sink_name       = "org-sharedservices-storage-log-sink"
    log_bucket_project  = "test-logging-prj-mec2-01"
    log_bucket_name     = "cb-logs-mec2-0"
    topic_name          = "ps-topic-logging-mec2-0"
    log_bucket_location = "me-central2"
    description         = "Storage logs in centralized bucket for billing, IAC and Logging project."
    filter              = ""
    include_children    = true
  }
}

topic_name = "ps-topic-logging-mec2-0"
subscription_name = "ps-sub-logging-mec2-0"
pub_sub_labels        = {
  environment  = "test"
  owner        = "test-team"
  app          = "test"
  department   = "test"
  service_type = "pub-sub"
}

iam_bindings = {
  gcs = {
    roles = [
      "roles/storage.objectCreator"
    ]
    service_accounts = [
      "serviceAccount:service-folder-123456778901@gcp-sa-logging.iam.gserviceaccount.com",
      "serviceAccount:service-folder-123456789012@gcp-sa-logging.iam.gserviceaccount.com",
      "serviceAccount:service-folder-012345678901@gcp-sa-logging.iam.gserviceaccount.com",
      "serviceAccount:service-folder-012345678901@gcp-sa-logging.iam.gserviceaccount.com",
      "serviceAccount:service-folder-012345678890@gcp-sa-logging.iam.gserviceaccount.com",
      "serviceAccount:service-folder-098765432101@gcp-sa-logging.iam.gserviceaccount.com",
      "serviceAccount:service-folder-098765432109@gcp-sa-logging.iam.gserviceaccount.com"
    ]
  }

  pubsub = {
    roles = [
      "roles/pubsub.publisher"
    ]
    service_accounts = [
      "serviceAccount:service-folder-123456789012@gcp-sa-logging.iam.gserviceaccount.com",
      "serviceAccount:service-folder-012345678901@gcp-sa-logging.iam.gserviceaccount.com",
      "serviceAccount:service-folder-012345678901@gcp-sa-logging.iam.gserviceaccount.com",
      "serviceAccount:service-folder-012345678901@gcp-sa-logging.iam.gserviceaccount.com",
      "serviceAccount:service-folder-123456789012@gcp-sa-logging.iam.gserviceaccount.com",
      "serviceAccount:service-folder-098765432101@gcp-sa-logging.iam.gserviceaccount.com",
      "serviceAccount:service-folder-098765432109@gcp-sa-logging.iam.gserviceaccount.com"
    ]
  }
}

