resource "google_kms_key_ring" "key_ring" {
  name     = var.key_ring_name
  location = var.region
  project  = var.project_id
}

resource "google_kms_crypto_key" "keys" {
  name            = var.key_name
  key_ring        = google_kms_key_ring.key_ring.id
  purpose         = "ENCRYPT_DECRYPT"
  rotation_period = "${var.rotation_days * 86400}s"
  labels          = var.labels

  version_template {
    algorithm        = var.algorithm
    protection_level = var.protection_level
  }

  lifecycle {
    prevent_destroy = true
  }
}

# --- IAM Bindings ---
# resource "google_kms_crypto_key_iam_binding" "bindings" {
#   for_each = { for b in var.iam_bindings : "${b.role}-${b.member}" => b }

#   crypto_key_id = google_kms_crypto_key.keys.id
#   role          = each.value.role
#   members       = [each.value.member]
# }
