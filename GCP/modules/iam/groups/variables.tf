
variable "customer_id" {
    default = "Clooud Identity customer ID"
    type = string
  
}

variable "domain" {
  description = "Primary domain"
  type = string
}

variable "rbac_groups" {
    description = <<EOT
    Map of RBAC groups keys to { display_name, description, email, members }
    members: list of identities (user:..., group:..., serviceAccount:...)
    EOT
    type= map(object({
      display_name = string
      description = string
      email = string
      members = list(string)
    }))
  
}