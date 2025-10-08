# provider "google-beta" {
#   source  = "hashicorp/google-beta"
#   version = "~> 5.38"
  
# }

resource "google_cloud_identity_group" "rbac" {
    provider = google-beta
    for_each = var.rbac_groups
    display_name = each.value.display_name
    description = each.value.description

    parent = "customers/${var.customer_id}"

    group_key {
      id = each.value.email
    }

    labels = {
      "cloudidentity.googleapis.com/groups.discussion_forum" = ""
    }
  
}

resource "google_cloud_identity_group_membership" "members" {
    provider = google-beta
    for_each = { for k, g in var.var.rbac_groups: k => g if length(g.members) > 0}

    group = google_cloud_identity_group.rbac[each.key].name

    dynamic "preferred_member_key" {
      for_each = each.value.members
      content {
        id = preferred_member_key.value
      }
    }
    roles {
      name = "MEMBER"
    }
  
}
