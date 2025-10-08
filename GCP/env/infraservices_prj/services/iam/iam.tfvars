project_id = "test-infraservices-prj-mec2-01"
region = "me-central-2"

service_accounts = {
    svc_infraservices_bootstrap = {
    project_id = "test-infraservices-prj-mec2-01"
    account_id = "svc-infraservices-bootstrap"
    display_name = "SVC infraservices Bootstrap"
    description = "Bootstrap/deployment SA for infraservices resources"
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
