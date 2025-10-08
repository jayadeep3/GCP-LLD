
provider "google" {
  alias   = "hub"
  project = var.hub_project_id
  region  = var.region
}

provider "google" {
  alias   = "spoke1"
  project = var.spokes["spoke1"].project_id
  region  = var.region
}

provider "google" {
  alias   = "spoke2"
  project = var.spokes["spoke2"].project_id
  region  = var.region
}

provider "google" {
  alias   = "spoke3"
  project = var.spokes["spoke3"].project_id
  region  = var.region
}

provider "google" {
  alias   = "spoke4"
  project = var.spokes["spoke4"].project_id
  region  = var.region
}

provider "google" {
  alias   = "spoke5"
  project = var.spokes["spoke5"].project_id
  region  = var.region
}

provider "google" {
  alias   = "spoke6"
  project = var.spokes["spoke6"].project_id
  region  = var.region
}

provider "google" {
  alias   = "spoke7"
  project = var.spokes["spoke7"].project_id
  region  = var.region
}


#backend
terraform {
  backend "gcs" {
    bucket  = "ndf-bootstrap-tf-backend-bucket"
    prefix  = "terraform/vpc-peering/tf-state"
    # credentials = "/path/to/key.json"   # only if not using env var
  }
}