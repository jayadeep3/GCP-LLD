project_id = "test-prod-prj-mec2-01"
region = "me-central-2"

service_accounts = {
    svc_prod_bootstrap = {
    project_id = "test-prod-prj-mec2-01"
    account_id = "svc-prod-bootstrap"
    display_name = "SVC Prod Bootstrap"
    description = "Bootstrap/deployment SA for prod resources"
    roles = [
      "roles/compute.instanceAdmin",
      "roles/compute.networkAdmin",
      "roles/compute.securityAdmin",
      "roles/iam.serviceAccountUser",
      "roles/compute.viewer",
      "roles/compute.osAdminLogin"
    ]
  } 
}

