
output "crypto_key_id" {
  description = "The ID of the KMS crypto key."
  value       = google_kms_crypto_key.keys.id
}
 
output "key_ring_id" {
  description = "The ID of the KMS key ring."
  value       = google_kms_key_ring.key_ring.id
}