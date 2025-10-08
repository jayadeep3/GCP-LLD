
variable "folders" {
  description = "Map of folder display_name => { parent = orgs/<id> or folders/<id> }"
  type = map(object({
    parent = string
  }))
  default = {}
}