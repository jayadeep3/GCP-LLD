resource "google_dns_managed_zone" "zones" {
  for_each = var.managed_zones

  name        = each.value.name
  dns_name    = each.value.dns_name
  description = try(each.value.description, "")
  project     = var.project_id
  visibility  = try(each.value.visibility, "private")
  labels      = try(each.value.labels, {})
}

# DNS Records
resource "google_dns_record_set" "records" {
  for_each = var.records

  name         = each.value.name
  type         = each.value.type
  ttl          = each.value.ttl
  managed_zone = each.value.managed_zone
  rrdatas      = each.value.rrdatas
  project      = var.project_id
}
