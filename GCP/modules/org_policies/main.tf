resource "google_org_policy_policy" "policies" {
  for_each = {
    for k, v in var.policies : k => v
    if try(v.enforce, null) != null
  }

  name   = "organizations/${var.org_id}/policies/${each.key}"
  parent = "organizations/${var.org_id}"

  spec {
    rules {
      enforce = each.value.enforce
    }
  }
}

resource "google_org_policy_policy" "list" {
  for_each = {
    for k, v in var.policies : k => v
    if try(v.allow, null) != null || try(v.deny, null) != null
  }

  name   = "organizations/${var.org_id}/policies/${each.key}"
  parent = "organizations/${var.org_id}"

  spec {
    rules {
      values {
        allowed_values = try(each.value.allow, null)
        denied_values  = try(each.value.deny, null)
      }
    }
  }
}
