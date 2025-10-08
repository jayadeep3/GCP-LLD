#vpc

project_id = "test-prod-prj-mec2-01"
region     = "me-central2"

vpcs = {
  "prod-spoke-mec2-vpc-0" = {
    vpc_name                = "prod-spoke-mec2-vpc-0"
    auto_create_subnetworks = false
    routing_mode            = "REGIONAL"
  }

  "dmz-spoke-mec2-vpc-0" = {
    vpc_name                = "dmz-spoke-mec2-vpc-0"
    auto_create_subnetworks = false
    routing_mode            = "REGIONAL"
  }
}



# #subnets

# project_id = "test-prod-prj-mec2-0"

subnets = {

  #prod vpc subnets
  snet-prod-web-mec2-0 = {
    subnet_name              = "snet-prod-web-mec2-0"
    region                   = "me-central2"
    ip_cidr_range            = "10.60.50.0/24"
    network                  = "prod-spoke-mec2-vpc-0"   
    private_ip_google_access = true
  
 # flow logs config
    enable_flow_logs     = true
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 1.0
    metadata             = "INCLUDE_ALL_METADATA"
  }
  
  snet-prod-app-mec2-0 = {
    subnet_name              = "snet-prod-app-mec2-0"
    region                   = "me-central2"
    ip_cidr_range            = "10.60.51.0/24"
    network                  = "prod-spoke-mec2-vpc-0"   
    private_ip_google_access = true
  
 # flow logs config
    enable_flow_logs     = true
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 1.0
    metadata             = "INCLUDE_ALL_METADATA"
  }

  snet-prod-DB-mec2-0 = {
    subnet_name              = "snet-prod-db-mec2-0"
    region                   = "me-central2"
    ip_cidr_range            = "10.60.52.0/25"
    network                  = "prod-spoke-mec2-vpc-0"   
    private_ip_google_access = true
  
 # flow logs config
    enable_flow_logs     = true
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 1.0
    metadata             = "INCLUDE_ALL_METADATA"
  }

# dmz vpc subnets
 snet-dmz-web-mec2-0 = {
    subnet_name              = "snet-dmz-web-mec2-0"
    region                   = "me-central2"
    ip_cidr_range            = "10.60.90.0/25"
    network                  = "dmz-spoke-mec2-vpc-0"   
    private_ip_google_access = true
  
 # flow logs config
    enable_flow_logs     = true
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 1.0
    metadata             = "INCLUDE_ALL_METADATA"
  }

  snet-dmz-integeration-mec2-0 = {
    subnet_name              = "snet-dmz-integeration-mec2-0"
    region                   = "me-central2"
    ip_cidr_range            = "10.60.90.128/25"
    network                  = "dmz-spoke-mec2-vpc-0"   
    private_ip_google_access = true
  
 # flow logs config
    enable_flow_logs     = true
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 1.0
    metadata             = "INCLUDE_ALL_METADATA"
  }

}


# firewall
 
firewall_rules = {

# prod vpc
  fw-deny-all-ingress-prod = {
    name          = "fw-deny-all-ingress-prod"
    network       = "prod-spoke-mec2-vpc-0"
    direction     = "INGRESS"
    action        = "deny"
    protocol      = "all"
    source_ranges = ["0.0.0.0/0"]
    priority      = 65535
    description   = "Deny all incoming traffic by default"
  }
  fw-deny-all-egress-prod = {
    name               = "fw-deny-all-egress-prod"
    network            = "prod-spoke-mec2-vpc-0"
    direction          = "EGRESS"
    action             = "deny"
    protocol           = "all"
    destination_ranges = ["0.0.0.0/0"]
    priority      = 65535
    description        = "Deny all egress unless explicitly allowed"
  }
  fw-allow-iap-ssh-prod = {
    name          = "fw-allow-iap-ssh-prod"
    network       = "prod-spoke-mec2-vpc-0"
    direction     = "INGRESS"
    action        = "allow"
    protocol      = "tcp"
    ports         = ["22", "3389"]
    source_ranges = ["35.235.240.0/20"]
    target_tags   = ["iap-access"]
    priority      = 65535
    description   = "Allow SSH/RDP via IAP"
  }
  fw-aadc-allow-prod = {
    name          = "fw-aadc-allow-prod"
    network       = "prod-spoke-mec2-vpc-0"
    direction     = "INGRESS"
    action        = "allow"
    protocol      = "tcp"
    ports         = ["135", "88", "389", "3268", "445"]
    source_ranges = ["10.0.0.0/8"]
    priority      = 65535
    description   = "Member servers to connect to AD"
  }
# dmz vpc
  fw-deny-all-ingress-dmz = {
    name          = "fw-deny-all-ingress-dmz"
    network       = "dmz-spoke-mec2-vpc-0"
    direction     = "INGRESS"
    action        = "deny"
    protocol      = "all"
    source_ranges = ["0.0.0.0/0"]
    priority      = 65535
    description   = "Deny all incoming traffic by default"
  }
  fw-deny-all-egress-dmz = {
    name               = "fw-deny-all-egress-dmz"
    network            = "dmz-spoke-mec2-vpc-0"
    direction          = "EGRESS"
    action             = "deny"
    protocol           = "all"
    destination_ranges = ["0.0.0.0/0"]
    priority      = 65535
    description        = "Deny all egress unless explicitly allowed"
  }
  fw-allow-iap-ssh-dmz = {
    name          = "fw-allow-iap-ssh-dmz"
    network       = "dmz-spoke-mec2-vpc-0"
    direction     = "INGRESS"
    action        = "allow"
    protocol      = "tcp"
    ports         = ["22", "3389"]
    source_ranges = ["35.235.240.0/20"]
    target_tags   = ["iap-access"]
    priority      = 65535
    description   = "Allow SSH/RDP via IAP"
  }
  fw-aadc-allow-dmz = {
    name          = "fw-aadc-allow-dmz"
    network       = "dmz-spoke-mec2-vpc-0"
    direction     = "INGRESS"
    action        = "allow"
    protocol      = "tcp"
    ports         = ["135", "88", "389", "3268", "445"]
    source_ranges = ["10.0.0.0/8"]
    priority      = 65535
    description   = "Member servers to connect to AD"
  }

}

# routes

# project_id = "test-prod-prj-mec2-0"

# Defines static routes for default internet egress.
# routes = {
#   "rt-prod-to-hub-trust-0" = {
#     route_project_id = "test-prodd-prj-mec2-100"
#     network          = "prod-spoke-mec2-vpc-0"
#     # next_hop_ilb      = "10.60.20.34/24"
#     dest_range       = "10.60.60.0/22"
#     next_hop_gateway = "default-internet-gateway"
#   }
# }

routes = {

  #prod custom routes
  "rt-prod-to-hub-trust-0" = {
    name        = "rt-prod-to-hub-trust-0"
    network     = "prod-spoke-mec2-vpc-0"
    next_hop_ilb = "10.60.20.34"
    dest_range  = "10.60.60.0/22"
    description = "Custom spoke routes"
  }

  "rt-prod-to-hub-trust-1" = {
    name        = "rt-prod-to-hub-trust-1"
    network     = "prod-spoke-mec2-vpc-0"
    next_hop_ilb = "10.60.20.34"
    dest_range  = "10.60.68.0/22"
    description = "Custom spoke routes"
  }

  "rt-prod-to-hub-trust-2" = {
    name        = "rt-prod-to-hub-trust-2"
    network     = "prod-spoke-mec2-vpc-0"
    next_hop_ilb = "10.60.20.34"
    dest_range  = "10.60.72.0/22"
    description = "Custom spoke routes"
  }

  "rt-prod-to-hub-trust-3" = {
    name        = "rt-prod-to-hub-trust-3"
    network     = "prod-spoke-mec2-vpc-0"
    next_hop_ilb = "10.60.20.34"
    dest_range  = "10.60.80.0/24"
    description = "Custom spoke routes"
  }

  "rt-prod-to-hub-trust-4" = {
    name        = "rt-prod-to-hub-trust-4"
    network     = "prod-spoke-mec2-vpc-0"
    next_hop_ilb = "10.60.20.34"
    dest_range  = "10.60.90.0/23"
    description = "Custom spoke routes"
  }

  "rt-prod-to-hub-trust-5" = {
    name        = "rt-prod-to-hub-trust-5"
    network     = "prod-spoke-mec2-vpc-0"
    next_hop_ilb = "10.60.20.34"
    dest_range  = "10.60.100.0/25"
    description = "Custom spoke routes"
  }

# gcp and onprem
  "rt-prod-to-hub-trust-6" = {
    name        = "rt-prod-to-hub-trust-6"
    network     = "prod-spoke-mec2-vpc-0"
    next_hop_ilb = "10.60.20.34"
    dest_range  = "10.2.0.0/15"
    description = "Custom spoke routes"
  }

  "rt-prod-to-hub-trust-7" = {
    name        = "rt-prod-to-hub-trust-7"
    network     = "prod-spoke-mec2-vpc-0"
    next_hop_ilb = "10.60.20.34"
    dest_range  = "10.1.0.0/16"
    description = "Custom spoke routes"
  }

  "rt-prod-to-hub-trust-8" = {
    name        = "rt-prod-to-hub-trust-8"
    network     = "prod-spoke-mec2-vpc-0"
    next_hop_ilb = "10.60.20.34"
    dest_range  = "10.10.0.0/16"
    description = "Custom spoke routes"
  }

 # internet and gcp
  "rt-prod-to-hub-trust-9" = {
    name        = "rt-prod-to-hub-trust-9"
    network     = "prod-spoke-mec2-vpc-0"
    next_hop_ilb = "10.60.20.22"
    dest_range  = "0.0.0.0/0"
    description = "Custom spoke routes"
  }
   




  # dmz custom routes

  "rt-dmz-to-hub-trust-0" = {
    name        = "rt-dmz-to-hub-trust-0"
    network     = "dmz-spoke-mec2-vpc-0"
    next_hop_ilb = "10.60.20.34"
    dest_range   = "10.60.48.0/21"
    description = "Custom spoke routes"
  }

  "rt-dmz-to-hub-trust-1" = {
    name        = "rt-dmz-to-hub-trust-1"
    network     = "dmz-spoke-mec2-vpc-0"
    next_hop_ilb = "10.60.20.34"
    dest_range  = "10.60.68.0/22"
    description = "Custom spoke routes"
  }

  "rt-dmz-to-hub-trust-2" = {
    name        = "rt-dmz-to-hub-trust-2"
    network     = "dmz-spoke-mec2-vpc-0"
    next_hop_ilb = "10.60.20.34"
    dest_range  = "10.60.72.0/22"
    description = "Custom spoke routes"
  }

  "rt-dmz-to-hub-trust-3" = {
    name        = "rt-dmz-to-hub-trust-3"
    network     = "dmz-spoke-mec2-vpc-0"
    next_hop_ilb = "10.60.20.34"
    dest_range  = "10.60.80.0/24"
    description = "Custom spoke routes"
  }

  "rt-dmz-to-hub-trust-4" = {
    name        = "rt-dmz-to-hub-trust-4"
    network     = "dmz-spoke-mec2-vpc-0"
    next_hop_ilb = "10.60.20.34"
    dest_range  = "10.60.60.0/23"
    description = "Custom spoke routes"
  }

  "rt-dmz-to-hub-trust-5" = {
    name        = "rt-dmz-to-hub-trust-5"
    network     = "dmz-spoke-mec2-vpc-0"
    next_hop_ilb = "10.60.20.34"
    dest_range  = "10.60.100.0/25"
    description = "Custom spoke routes"
  }

  #gcp and onprem
  
  "rt-dmz-to-hub-trust-6" = {
    name        = "rt-dmz-to-hub-trust-6"
    network     = "dmz-spoke-mec2-vpc-0"
    next_hop_ilb = "10.60.20.34"
    dest_range  = "10.2.0.0/15"
    description = "Custom spoke routes"
  }

  "rt-dmz-to-hub-trust-7" = {
    name        = "rt-dmz-to-hub-trust-7"
    network     = "dmz-spoke-mec2-vpc-0"
    next_hop_ilb = "10.60.20.34"
    dest_range  = "10.1.0.0/16"
    description = "Custom spoke routes"
  }

  "rt-dmz-to-hub-trust-8" = {
    name        = "rt-dmz-to-hub-trust-8"
    network     = "dmz-spoke-mec2-vpc-0"
    next_hop_ilb = "10.60.20.34"
    dest_range  = "10.10.0.0/16"
    description = "Custom spoke routes"
  }
 # internet and gcp

 "rt-dmz-to-hub-trust-9" = {
    name        = "rt-dmz-to-hub-trust-9"
    network     = "dmz-spoke-mec2-vpc-0"
    next_hop_ilb = "10.60.20.22"
    dest_range  = "0.0.0.0/0"
    description = "Custom spoke routes"
  }

}


