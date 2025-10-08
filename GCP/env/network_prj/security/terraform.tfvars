project_id = "ndf-network-prj-mec2-01"
region = "me-central2"

kms_environments = {
  network = {
    region           = "me-central2"
    key_ring         = "ckms-hub-vm-mec2-01"
    key_name         = "ckms-hub-vm-mec2-01"
    algorithm        = "GOOGLE_SYMMETRIC_ENCRYPTION"
    protection_level = "SOFTWARE"
    rotation_days    = 90
    # iam_bindings = [
    #   {
    #     role   = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
    #     member = "serviceAccount:hub-app-sa@my-landing-zone-project.iam.gserviceaccount.com"
    #   },
    #   {
    #     role   = "roles/cloudkms.admin"
    #     member = "group:security-admins@mycompany.com"
    #   }
    # ]
    labels  = {
      environment = "hub"
      owner       = "ndf-team"
      app         = "ndf-app"
      department  = "ndf-security"
      service_type = "kms"
    }
  }
}
