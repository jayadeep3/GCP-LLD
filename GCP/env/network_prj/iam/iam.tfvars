
project_id = "ndf-network-prj-mec2-01"
region     = "me-central2"

service_accounts = {
  svc_hub_networking = {
    project_id = "ndf-network-prj-mec2-01"
    account_id = "svc-hub-networking"
    display_name = "SVC Hub Networking"
    description = "Automation SA for hub VPC and network ops"
    roles = [
      "roles/compute.networkAdmin",
      "roles/compute.securityAdmin",
      "roles/compute.routerAdmin",
      "roles/compute.instanceAdmin",
      "roles/iam.serviceAccountUser"
    ]
  }
}