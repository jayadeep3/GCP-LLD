resource "google_compute_network" "vpc" {
  for_each = var.vpcs

  name                    = each.value.vpc_name
  project                 = var.project_id
  auto_create_subnetworks = false
  routing_mode            = each.value.routing_mode
}
