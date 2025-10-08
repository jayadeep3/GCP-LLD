
project_id = "ndf-bootstrap-prj"
region     = "me-central2"
org_id     = "28552764765"

# folders = {
#   "Security"    = { parent = "organizations/209803908259" }
# }

policies = {
  "compute.managed.disableSerialPortAccess" = { enforce = true } 
  "compute.trustedImageProjects"    = { allow = ["projects/debian-cloud", "projects/ubuntu-os-cloud"] }
  "compute.managed.vmExternalIpAccess"      = {enforce = true}
  "storage.publicAccessPrevention"  = {enforce = true}
  "compute.managed.requireOsLogin"          = {enforce = true}
  "iam.managed.disableServiceAccountKeyUpload" = {enforce =true}
  # "compute.disablePreviewFeatures"  = {enforce = true}  no such constraint found
  # "gcp.resourceLocations.requireResourceLabels" = {enforce =true} (no such constraint found)
  # "storage.uniformBucketLevelAccess" = {enforce = true} (already enabled)
  # "iam.disableServiceAccountKeyCreation" = {enforce = true} (already enabled)
  # "iam.automaticIamGrantsForDefaultServiceAccounts" = {enforce = true} (already enabled)
  "compute.disableGuestAttributesAccess" ={enforce = true}
  "iam.serviceAccountKeyExpiryHours" = {enforce = true}
  "compute.skipDefaultNetworkCreation" = {enforce = true}
  # "iam.allowedPolicyMemberDomains" = { allow = [""]} # your Google Workspace domain ID (already enabled)
  "gcp.resourceLocations"           = { allow = ["me-central2"] } # example
  
}