variable "notif_channels" {
  type    = map(any)
  default = {}
}
 
variable "alert_policies" {
  type    = map(any)
  default = {}
}
 
variable "monitored_projects" {
  type        = list(string)
  description = "List of project IDs to attach to the monitoring workspace"
}
 
variable "project_id" {
  type = string
}
variable "region" {
  type = string
}
 