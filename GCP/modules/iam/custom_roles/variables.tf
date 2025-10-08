

variable "project_id" {
  type = string
}

variable "roles" {
  description = "Map: role_id => { title, description, permissions=[...], stage }"
  type = map(object({
    title       = string
    description = optional(string, "")
    permissions = list(string)
    stage       = optional(string, "GA")
  }))
  default = {}
}