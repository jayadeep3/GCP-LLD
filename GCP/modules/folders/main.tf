resource "google_folder" "this" {
  for_each     = var.folders

  display_name = each.key
  parent       = each.value.parent
}
