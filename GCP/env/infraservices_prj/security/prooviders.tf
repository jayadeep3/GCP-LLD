
provider "google" {
  project = var.project_id
  region  = var.region
}

provider "google-beta" {
  project = var.project_id
  region  = var.region
}

#backend
terraform {
  backend "gcs" {
    bucket  = "ndf-bootstrap-tf-backend-bucket"
    prefix  = "terraform/infraservices/security-tf-state"
    # credentials = "/path/to/key.json"   # only if not using env var
  }
}