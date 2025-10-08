resource "google_organization_iam_binding" "org" {
    for_each = { for b in var.org_bindings : b.role => b } 
    org_id = var.org_id
    role = each.value.role
    members = each.value.members
}

resource "google_folder_iam_binding" "folder" {
  for_each = { for b in var.folder_bindings : "${b.folder_id}-${b.role}" => b }
  folder = each.value.folder_id
  role = each.value.role
  members = each.value.members

}

resource "google_project_iam_binding" "project" {
    for_each = { for b in var.project_bindings : "${b.project_id}-${b.role}" => b}
    project = each.value.project_id
    role = each.value.role
    members = each.value.members
  
}
