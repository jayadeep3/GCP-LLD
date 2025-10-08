variable "org_id" {
  description = "Numeric organization ID (without organizations/)."
  type        = string
}

variable "policies" {
  description = "Map: constraint => { enforce=bool | allow=[...] | deny=[...] }"
  type = map(object({
    enforce = optional(bool)
    allow   = optional(list(string))
    deny    = optional(list(string))
  }))
  default = {}
}