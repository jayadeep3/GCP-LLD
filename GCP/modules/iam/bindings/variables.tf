
variable "org_id" {
  description = "Organization ID"
  type = string
}

variable "org_bindings" {
    description = "List of org-level bindings"
    type = list(object({
      role = string
      members = list(string)
    }))
    default = []
}

variable "folder_bindings" {
    description = "List of folder-level bindings"
    type = list(object({
      folder_id = string
      role = string
      members = list(string)
    }))
    default = []
}

variable "project_bindings" {
    description = "List of project-level bindings"
    type = list(object({
      project_id = string
      role = string
      members = list(string)
    }))
    default = []
}

