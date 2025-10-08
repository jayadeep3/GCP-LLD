module "top_level_folders" {
  source = "../../modules/folders"

  folders = {
    test-org-sharedservices-folder    = { display_name = "test-org-sharedServices-folder", parent = "organizations/${var.org_id}" }
    test-hub-networking-folder         = { display_name = "test-hub-networking-folder", parent = "organizations/${var.org_id}" }
    test-platform-workloads-folders = { display_name = "test-platform-workloads-folder", parent = "organizations/${var.org_id}" }
    test-security-folder         = { display_name = "test-security-folder", parent = "organizations/${var.org_id}" }
    test-sbx-folders                = { display_name = "test-sbx-folders", parent = "organizations/${var.org_id}" }
  }
}
