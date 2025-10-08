
terraform {
  backend "gcs" {
    bucket = "ndf-bootstrap-tf-backend-bucket"   # replace with your bucket
    prefix = "org-bootstrap-subfolder"
  }
}

provider "google" {
  project = null
  region  = "me-central2"
}