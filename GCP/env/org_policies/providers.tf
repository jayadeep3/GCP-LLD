
provider "google" {
  project = var.project_id
  region  = var.region
  credentials = file("C:Users/prakushwah/Downloads/ndf-iac-prj-mec2-01-d47cc7b0ca3f.json")
}

provider "google-beta" {
  project = var.project_id
  region  = var.region
}

#backend
terraform {
  backend "gcs" {
    bucket  = "ndf-bootstrap-tf-backend-bucket"
    prefix  = "terraform/org_policies/org_policies-tf-state"
    # credentials = "/path/to/key.json"   # only if not using env var
  }
}