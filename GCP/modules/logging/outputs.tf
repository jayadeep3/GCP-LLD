output "sinks" {
  description = "Details of the log sinks created."
  value = {
    for k, sink in google_logging_folder_sink.log_sink : k => {
      name            = sink.name
      destination     = sink.destination
      writer_identity = sink.writer_identity
    }
  }
}

output "topic_name" {
  value = google_pubsub_topic.logs_topic.name
}

output "subscription_name" {
  value = google_pubsub_subscription.logs_subscription.name
}