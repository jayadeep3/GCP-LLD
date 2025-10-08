
provider "google" {
  project = var.project_id
  region  = var.region
}

provider "google-beta" {
  project = var.project_id
  region  = var.region
}

terraform {
  backend "gcs" {
    bucket = "ndf-bootstrap-tf-backend-bucket"   #replace with your bucket
    prefix = "terraform/infraservices/iam-tf-state"
  }
}
