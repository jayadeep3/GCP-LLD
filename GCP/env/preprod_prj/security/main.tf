locals {
  kms_configs = var.kms_environments
}

module "kms" {
  for_each = local.kms_configs

  source   = "../../../modules/security/cmek_keys"

  project_id          = var.project_id
  region              = each.value.region
  key_ring_name       = each.value.key_ring
  key_name            = each.value.key_name
  algorithm           = each.value.algorithm
  protection_level    = each.value.protection_level
  rotation_days       = each.value.rotation_days
  labels              =  each.value.labels
}
