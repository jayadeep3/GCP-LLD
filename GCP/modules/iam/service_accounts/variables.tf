
variable "service_accounts" {
  description = <<EOT
  Map keyed by logical SA name to: { project_id, display_name, description, roles = list(string) }
  EOT

  type = map(object({
    project_id = string
    account_id = string
    display_name = string
    description = string
    roles = list(string)
  }))
  
}