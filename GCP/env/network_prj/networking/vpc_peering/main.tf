module "vpc_peering" {
  source         = "../../../../modules/networking/vpc_peering"
  hub_project_id = var.hub_project_id
  hub_vpc_name   = var.hub_vpc_name
  region         = var.region
  spokes         = var.spokes
}
