resource "google_project_iam_custom_role" "custom_role" {

  for_each = var.roles
  role_id     = each.key
  project     = var.project_id
  title       = each.value.title
  description = try(each.value.description, "")
  permissions = each.value.permissions
  stage = try(each.value.stage, "GA")
}
