project_id = "test-billing-prj-mec2-01"
region = "me-central2"

central_billing_project = "test-billing-prj-mec2-01"
billing_dataset_location = "me-central2"

datasets = {
  standard_billing_export = {
    friendly_name = "Standard usage cost data"
    description   = "Contains standard Cloud Billing account cost usage information"
    labels  = {
      environment = "billing"
      owner       = "test-team"
      app         = "test-billing-app"
      department  = "test-billing"
      service_type = "billing"
    }
  }
  detailed_billing_export = {
    friendly_name = "Detailed usage cost data"
    description   = "Contains detailed Cloud Billing account cost usage information"
    labels  = {
      environment = "billing"
      owner       = "test-team"
      app         = "test-billing-app"
      department  = "test-billing"
      service_type = "billing"
    }
  }

}
