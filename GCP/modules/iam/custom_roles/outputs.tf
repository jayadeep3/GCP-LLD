
output "role_names" { value = [for r in google_project_iam_custom_role.role : r.name] }