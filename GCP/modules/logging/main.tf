resource "google_storage_bucket" "bucket" {
  project                     = var.project_id
  name                        = var.log_bucket_name
  location                    = var.log_bucket_location
  force_destroy               = true
  uniform_bucket_level_access = true
  labels   = var.labels # <-- added
}

# Create a Log Sink
resource "google_logging_folder_sink" "log_sink" {
  for_each = var.log_export_sinks
  name                = "${each.value.log_sink_name}-storage"
  folder              = each.value.parent_resource_id
  destination         = "storage.googleapis.com/${each.value.log_bucket_name}/"
  filter              = each.value.filter
  description         = each.value.description
#   unique_writer_identity = var.unique_writer_identity
  include_children    = each.value.include_children
}

resource "google_pubsub_topic" "logs_topic" {
  name    = var.topic_name
  project = var.project_id
  labels  = var.pub_sub_labels
}

# # Create Pub/Sub subscriptions for each topic
resource "google_pubsub_subscription" "logs_subscription" {

  name  = var.subscription_name
  topic = google_pubsub_topic.logs_topic.name
  labels = var.pub_sub_labels
}

resource "google_logging_folder_sink" "pubsub_sink" {
  for_each = var.log_export_sinks
 
  name             = "${each.value.log_sink_name}-pubsub"
  folder           = each.value.parent_resource_id
  destination      = "pubsub.googleapis.com/projects/${each.value.log_bucket_project}/topics/${each.value.topic_name}"
  filter           = each.value.filter
  description      = each.value.description
  include_children = each.value.include_children
}

resource "google_storage_bucket_iam_member" "gcs_writer" {
  for_each = {
    for binding in flatten([
      for sa in var.iam_bindings["gcs"].service_accounts : [
        for role in var.iam_bindings["gcs"].roles : {
          sa   = sa
          role = role
        }
      ]
    ]) : "${replace(binding.sa, ":", "_")}-${replace(binding.role, "/", "_")}" => binding
  }

  bucket = google_storage_bucket.bucket.name
  role   = each.value.role
  member = each.value.sa
}

resource "google_pubsub_topic_iam_member" "pubsub_writer" {
  for_each = {
    for binding in flatten([
      for sa in var.iam_bindings["pubsub"].service_accounts : [
        for role in var.iam_bindings["pubsub"].roles : {
          sa   = sa
          role = role
        }
      ]
    ]) : "${replace(binding.sa, ":", "_")}-${replace(binding.role, "/", "_")}" => binding
  }

  topic  = google_pubsub_topic.logs_topic.name
  role   = each.value.role
  member = each.value.sa
}
