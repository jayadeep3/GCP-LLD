

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.0"
    }
  }

  backend "gcs" {
    bucket = "ndf-bootstrap-tf-backend-bucket"   # or per-project backend bucket
    prefix = "org-foundation"
  }
}