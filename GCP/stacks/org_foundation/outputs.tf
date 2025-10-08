
# output "project_ids" {
#   description = "All created project IDs"
#   value = {
#     billing    = module.billing_project.project_id
#     networking = module.network_project.project_id
#     logging    = module.logging_project.project_id
#     security   = module.security_project.project_id
#     sandbox    = module.sandbox_project.project_id
#     prod       = module.prod_project.project_id
#     preprod    = module.preprod_project.project_id
#     dev        = module.dev_project.project_id
#     infra      = module.infra_project.project_id
#   }
# }