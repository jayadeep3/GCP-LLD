module "platform_subfolders" {
  source = "../../../modules/folders"
  folders = {
    test-prod-folder         = { display_name = "test-prod-folder", parent = var.platform_workloads_id }
    test-pp-folder       = { display_name = "test-pp-folder", parent = var.platform_workloads_id }
    test-dev-folder          = { display_name = "test-dev-folder", parent = var.platform_workloads_id }
    test-infraservices-folder = { display_name = "test-infraservices-folder", parent = var.platform_workloads_id }
  }
}
