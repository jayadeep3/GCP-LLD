# Create Cloud Armor Security Policy
resource "google_compute_security_policy" "policy" {
  name        = var.policy_name
  description = var.policy_description
  project     = var.project_id

  dynamic "rule" {
    for_each = var.rules
    content {
      action   = rule.value.action
      priority = rule.value.priority
      match {
        versioned_expr = rule.value.versioned_expr
        config {
          src_ip_ranges = rule.value.src_ip_ranges
        }
      }
      description = lookup(rule.value, "description", null)
    }
  }
  # Default rule required by Cloud Armor
  rule {
    action   = var.default_rule_action
    priority = 2147483647
    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = ["*"]
      }
    }
    description = "Default catch-all rule"
  }
}

# Attach Security Policy to Backend Service (Load Balancer)
resource "google_compute_backend_service" "backend_service" {
  for_each = var.backends

  name                  = each.value.name
  project               = var.project_id
  protocol              = lookup(each.value, "protocol", "HTTP")
  load_balancing_scheme = lookup(each.value, "scheme", "EXTERNAL")
  port_name             = lookup(each.value, "port_name", "http")
  timeout_sec           = lookup(each.value, "timeout_sec", 30)

  security_policy       = google_compute_security_policy.policy.id
}
