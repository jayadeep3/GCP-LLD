variable "hub_project_id" {
  type        = string
  description = "Project ID of the hub VPC"
}

variable "hub_vpc_name" {
  type        = string
  description = "Hub VPC network name"
}

variable "region" {
  type        = string
  description = "Region for peering"
}

variable "spokes" {
  type = map(object({
    project_id : string
    vpc_name   : string
  }))
  description = "Map of spoke VPCs with project IDs and VPC names"
}
