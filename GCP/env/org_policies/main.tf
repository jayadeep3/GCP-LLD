module "org_policies" {
  source   = "../../modules/org_policies"
  org_id   = var.org_id
  policies = var.policies
}
