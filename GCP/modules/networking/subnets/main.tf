resource "google_compute_subnetwork" "subnets" {
  for_each                  = var.subnets
  name                      = each.value.subnet_name
  ip_cidr_range             = each.value.ip_cidr_range  
  region                    = each.value.region
  network                   = each.value.vpc_self_link
  private_ip_google_access  = each.value.private_ip_google_access
  project                   = var.project_id

  # flow logs block
  dynamic "log_config" {
    for_each = each.value.enable_flow_logs ? [1] : []
    content {
      aggregation_interval = each.value.aggregation_interval
      flow_sampling        = each.value.flow_sampling
      metadata             = each.value.metadata
    }
  }
}
