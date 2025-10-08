
project_id = "ndf-logging-prj-mec2-01"
region = "me-central2"
log_bucket_location = "me-central2"
log_bucket_name = "cb-logs-mec2-0"
labels        = {
  environment  = "ndf"
  owner        = "ndf-team"
  app          = "ndf"
  department   = "ndf"
  service_type = "storage"
}
/******************************************
 Log Export Sink Details
 *****************************************/
log_export_sinks = {
  log_export_sink_01 = {
    parent_resource_id  = "folders/162494102803"
    log_sink_name       = "networking-log-sink"
    topic_name          = "ps-topic-logging-mec2-0"
    log_bucket_project  = "ndf-logging-prj-mec2-01"
    log_bucket_name     = "cb-logs-mec2-0"
    log_bucket_location = "me-central2"
    description         = "Storage logs in centralized bucket for hub networking project."
    filter              = ""
    include_children    = true
    # folder_name         = "ndf-hub-networking-folder"
  }
  log_export_sink_02 = {
    parent_resource_id  = "folders/269348856312"
    log_sink_name       = "infraservices-log-sink"
    topic_name          = "ps-topic-logging-mec2-0"
    log_bucket_project  = "ndf-logging-prj-mec2-01"
    log_bucket_name     = "cb-logs-mec2-0"
    log_bucket_location = "me-central2"
    description         = "Storage logs in centralized bucket for infraservices project."
    filter              = ""
    include_children    = true
    # folder_name         = "ndf-infraservices-folder"
  }
  log_export_sink_03 = {
    parent_resource_id  = "folders/382113928519"
    log_sink_name       = "dev-log-sink"
    topic_name          = "ps-topic-logging-mec2-0"
    log_bucket_project  = "ndf-logging-prj-mec2-01"
    log_bucket_name     = "cb-logs-mec2-0"
    log_bucket_location = "me-central2"
    description         = "Storage logs in centralized bucket for dev project."
    filter              = ""
    include_children    = true
    # folder_name         = "ndf-dev-folder"
  }
  log_export_sink_04 = {
    parent_resource_id  = "folders/85737518767"
    log_sink_name       = "pp-log-sink"
    topic_name          = "ps-topic-logging-mec2-0"
    log_bucket_project  = "ndf-logging-prj-mec2-01"
    log_bucket_name     = "cb-logs-mec2-0"
    log_bucket_location = "me-central2"
    description         = "Storage logs in centralized bucket for preprod project."
    filter              = ""
    include_children    = true
    # folder_name         = "ndf-preprod-folder"
  }
  log_export_sink_05 = {
    parent_resource_id  = "folders/149596284825"
    log_sink_name       = "prod-log-sink"
    topic_name          = "ps-topic-logging-mec2-0"
    log_bucket_project  = "ndf-logging-prj-mec2-01"
    log_bucket_name     = "cb-logs-mec2-0"
    log_bucket_location = "me-central2"
    description         = "Storage logs in centralized bucket for prod project."
    filter              = ""
    include_children    = true
    # folder_name         = "ndf-prod-folder"
  }
  log_export_sink_06 = {
    parent_resource_id  = "folders/956689357329"
    log_sink_name       = "security-log-sink"
    topic_name          = "ps-topic-logging-mec2-0"
    log_bucket_project  = "ndf-logging-prj-mec2-01"
    log_bucket_name     = "cb-logs-mec2-0"
    log_bucket_location = "me-central2"
    description         = "Storage logs in centralized bucket for security project."
    filter              = ""
    include_children    = true
    # folder_name         = "ndf-security-folder"
  }

  log_export_sink_07 = {
    parent_resource_id  = "folders/1074937847558"
    log_sink_name       = "org-sharedservices-storage-log-sink"
    log_bucket_project  = "ndf-logging-prj-mec2-01"
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
  environment  = "ndf"
  owner        = "ndf-team"
  app          = "ndf"
  department   = "ndf"
  service_type = "pub-sub"
}

iam_bindings = {
  gcs = {
    roles = [
      "roles/storage.objectCreator"
    ]
    service_accounts = [
      "serviceAccount:service-folder-85737518767@gcp-sa-logging.iam.gserviceaccount.com",
      "serviceAccount:service-folder-1074937847558@gcp-sa-logging.iam.gserviceaccount.com",
      "serviceAccount:service-folder-269348856312@gcp-sa-logging.iam.gserviceaccount.com",
      "serviceAccount:service-folder-149596284825@gcp-sa-logging.iam.gserviceaccount.com",
      "serviceAccount:service-folder-162494102803@gcp-sa-logging.iam.gserviceaccount.com",
      "serviceAccount:service-folder-382113928519@gcp-sa-logging.iam.gserviceaccount.com",
      "serviceAccount:service-folder-956689357329@gcp-sa-logging.iam.gserviceaccount.com"
    ]
  }

  pubsub = {
    roles = [
      "roles/pubsub.publisher"
    ]
    service_accounts = [
      "serviceAccount:service-folder-85737518767@gcp-sa-logging.iam.gserviceaccount.com",
      "serviceAccount:service-folder-1074937847558@gcp-sa-logging.iam.gserviceaccount.com",
      "serviceAccount:service-folder-269348856312@gcp-sa-logging.iam.gserviceaccount.com",
      "serviceAccount:service-folder-149596284825@gcp-sa-logging.iam.gserviceaccount.com",
      "serviceAccount:service-folder-162494102803@gcp-sa-logging.iam.gserviceaccount.com",
      "serviceAccount:service-folder-382113928519@gcp-sa-logging.iam.gserviceaccount.com",
      "serviceAccount:service-folder-956689357329@gcp-sa-logging.iam.gserviceaccount.com"
    ]
  }
}
