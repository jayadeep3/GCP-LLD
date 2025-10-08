
provider "google" {
  project = var.project_id
  region  = var.region
}

provider "google-beta" {
  project = var.project_id
  region  = var.region
}


# ----------------------------------------------------------------------------------------------------------------
# Retrieve zones
# ----------------------------------------------------------------------------------------------------------------

data "google_client_config" "main" {}

data "google_compute_zones" "main" {
  project = data.google_client_config.main.project
  region  = var.region
}


terraform {
  backend "gcs" {
    bucket = "ndf-bootstrap-tf-backend-bucket"   #replace with your bucket
    prefix = "terraform/prod/vm-tf-state"
  }
}
