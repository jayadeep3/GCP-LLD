resource "google_monitoring_monitored_project" "monitored" {
  for_each  = toset(var.monitored_projects)
  metrics_scope = var.project_id
  name          = each.value
}

resource "google_monitoring_notification_channel" "ch" {
  for_each      = var.notification_channels

  project      = var.project_id
  display_name = each.key
  type         = each.value.type
  labels       = each.value.labels
}

resource "google_monitoring_alert_policy" "ap" {
  for_each     = var.alert_policies

  project      = var.project_id
  display_name = each.value.display_name
  combiner     = try(each.value.combiner, "OR")
  user_labels  = try(each.value.labels, {})

  conditions {
    display_name = "${each.value.display_name} condition"

    condition_threshold {
      # filter = "metric.type=\"${each.value.metric_type}\" AND resource.type=\"${each.value.resource_type}\" AND metric.label=\"${each.value.metric_labels}"
      filter = join(" AND ", compact([
        "metric.type=\"${each.value.metric_type}\"",
        "resource.type=\"${each.value.resource_type}\"",
        join(" AND ", [
          for k, v in each.value.metric_labels : "metric.label.${k}=\"${v}\""
        ])
      ]))
      comparison      = "COMPARISON_GT"
      threshold_value = try(each.value.threshold, 0)
      duration        = try(each.value.duration, "60s")

      aggregations {
        alignment_period   = "60s"
        per_series_aligner = try(each.value.aligner, "ALIGN_RATE")
      }
    }
  }
  notification_channels = [
    for c in google_monitoring_notification_channel.ch : c.name
  ]
  enabled = true
}
