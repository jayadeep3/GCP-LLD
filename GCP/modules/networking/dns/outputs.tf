
output "zone_names" {
  description = "List of managed DNS zone names"
  value       = [for z in google_dns_managed_zone.zones : z.name]
}

output "record_names" {
  description = "List of DNS record names"
  value       = [for r in google_dns_record_set.records : r.name]
}