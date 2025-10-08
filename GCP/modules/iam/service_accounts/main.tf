# Create service accounts
resource "google_service_account" "sa" {
  for_each     = var.service_accounts
  project      = each.value.project_id
  account_id   = each.value.account_id
  display_name = each.value.display_name
  description  = each.value.description
}

# Build role bindings for each SA + role combination
locals {
  sa_role_bindings = flatten([
    for k, v in var.service_accounts : [
      for r in v.roles : {
        key        = "${v.project_id}::${k}::${r}"
        project_id = v.project_id
        member     = "serviceAccount:${google_service_account.sa[k].email}"
        role       = r
      }
    ]
  ])
}

# Bind each role to the project
resource "google_project_iam_member" "sa_role_each" {
  for_each = { for b in local.sa_role_bindings : b.key => b }

  project = each.value.project_id
  role    = each.value.role
  member  = each.value.member
}
