project_id = "ndf-pp-prj-mec2-01"
region     = "me-central2"
kms_environments = {
  preprod = {
    region           = "me-central2"
    key_ring         = "ckms-pp-vm-mec2-0"
    key_name         = "ckms-pp-vm-mec2-0"
    algorithm        = "GOOGLE_SYMMETRIC_ENCRYPTION"
    protection_level = "SOFTWARE"
    rotation_days    = 90
    # iam_bindings = [
    #   {
    #     role   = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
    #     member = "serviceAccount:pp-app-sa@my-landing-zone-project.iam.gserviceaccount.com"
    #   },
    #   {
    #     role   = "roles/cloudkms.admin"
    #     member = "group:security-admins@mycompany.com"
    #   }
    # ]
    labels  = {
      environment = "pp"
      owner       = "ndf-team"
      app         = "ndf-app"
      department  = "ndf-security"
      service_type = "kms"
    }
  }
}


