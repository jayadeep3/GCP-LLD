module "billing_datasets" {
  source                  = "../../modules/billing"
  central_billing_project = var.central_billing_project
  billing_dataset_location = var.billing_dataset_location
  datasets                 = var.datasets
}
