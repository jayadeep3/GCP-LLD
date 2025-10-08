project_id = "ndf-prod-prj-mec2-01"
region     = "me-central2"
kms_environments = {
  prod = {
    region           = "me-central2"
    key_ring         = "ckms-prod-vm-mec2-0"
    key_name         = "ckms-prod-vm-mec2-0"
    algorithm        = "GOOGLE_SYMMETRIC_ENCRYPTION"
    protection_level = "SOFTWARE"
    rotation_days    = 90
    # iam_bindings = [
    #   {
    #     role   = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
    #     member = "serviceAccount:prod-app-sa@my-landing-zone-project.iam.gserviceaccount.com"
    #   },
    #   {
    #     role   = "roles/cloudkms.admin"
    #     member = "group:security-admins@mycompany.com"
    #   }
    # ]
    labels  = {
      environment = "prod"
      owner       = "ndf-team"
      app         = "ndf-app"
      department  = "ndf-security"
      service_type = "kms"
    }
  }
}