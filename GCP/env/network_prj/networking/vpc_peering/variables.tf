variable "hub_project_id" {
  type        = string
  default     = "ndf-network-prj-mec2-01"    # replace with your actual hub project id
  description = "Hub project ID"
}

variable "hub_vpc_name" {
  type        = string
  default     = "hub-trust-mec2-vpc-0"           # replace with your actual hub VPC name
  description = "Hub VPC name"
}

variable "region" {
  type        = string
  default     = "me-central2"
  description = "Region for peering"
}

variable "spokes" {
  type = map(object({
    project_id : string
    vpc_name   : string
  }))
  default = {
    spoke1 = { project_id = "ndf-infraservices-prj-mec2-01", vpc_name = "infra-spoke-mec2-vpc-0" }
    spoke2 = { project_id = "ndf-prod-prj-mec2-01", vpc_name = "prod-spoke-mec2-vpc-0" }
    spoke3 = { project_id = "ndf-prod-prj-mec2-01", vpc_name = "dmz-spoke-mec2-vpc-0" }
    spoke4 = { project_id = "ndf-dev-prj-mec2-01", vpc_name = "dev-spoke-mec2-vpc-0" }
    spoke5 = { project_id = "ndf-pp-prj-mec2-01", vpc_name = "pp-spoke-mec2-vpc-0" }
    spoke6 = { project_id = "ndf-security-prj-mec2-01", vpc_name = "security-spoke-mec2-vpc-0" }
    
    #spoke 7 - hub-trust-vpc + hub-transit
    spoke7 = { project_id = "ndf-network-prj-mec2-01", vpc_name = "hub-transit-mec2-vpc-0" }
  }
  description = "Map of spoke project IDs and VPC names"
}
