module "vpc" {
  source     = "../../../modules/networking/vpc"
  project_id = var.project_id
  vpcs       = var.vpcs
}

module "subnets" {
  source     = "../../../modules/networking/subnets"
  project_id = var.project_id

  subnets = {
    for k, v in var.subnets : k => merge(v, {
      vpc_self_link = module.vpc.vpc_self_links[v.network]
    })
  }
}

module "firewall" {
  source         = "../../../modules/networking/firewall"
  project_id = var.project_id
  firewall_rules = var.firewall_rules
}

# module "routes" {
#   source     = "../../../modules/networking/routes"
#   project_id = var.project_id
#   routes     = var.routes
# }

# # module "routes" {
# #   source     = "../../modules/networking/routes"
# #   routes     = var.routes
# # }

module "routers" {
  source     = "../../../modules/networking/routers"
  project_id = var.project_id
  routers    = var.routers
}



module "nat" {
  source     = "../../../modules/networking/nat"
  project_id = var.project_id
  nats       = var.nats
}

# # /*
# # module "classic_vpn" {
# #   source      = "../../../modules/networking/vpn/classic_vpn"
# #   project_id  = var.project_id
# #   vpns        = var.vpns
# #   vpn_tunnels = var.vpn_tunnels
# # }

# module "ha_vpn" {
#   source          = "../../../modules/networking/vpn/ha_vpn"
#   project_id      = var.project_id
#   ha_vpns         = var.ha_vpns
#   ha_vpn_tunnels  = var.ha_vpn_tunnels
# }

# # module "partner_interconnect" {
# #   source                = "../../../modules/networking/vpn/partner_interconnect"
# #   project_id            = var.project_id
# #   partner_interconnects = var.partner_interconnects
# # }

module "dns" {
  source     = "../../../modules/networking/dns"
  project_id = var.project_id
  managed_zones = var.managed_zones
  records       = var.records
}


module "internal_lb" {
  for_each   = var.internal_lbs
  source     = "../../../modules/networking/ilb"

  project_id = var.project_id
  name       = each.value.name
  region     = each.value.region
  network    = each.value.network
  subnetwork = each.value.subnetwork
  ip_address = each.value.ip_address
  labels     = each.value.labels
}
