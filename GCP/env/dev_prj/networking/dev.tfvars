#vpc

project_id = "ndf-dev-prj-mec2-01"
region     = "me-central2"

vpcs = {
  "dev-spoke-mec2-vpc-0" = {
    vpc_name                = "dev-spoke-mec2-vpc-0"
    auto_create_subnetworks = false
    routing_mode            = "REGIONAL"
  }
}


# #subnet

# project_id = "ndf-dev-prj-mec2-0"

subnets = {
  snet-dev-web-mec2-0 = {
    subnet_name              = "snet-dev-web-mec2-0"
    region                   = "me-central2"
    ip_cidr_range            = "10.60.70.0/24"
    network                  = "dev-spoke-mec2-vpc-0"   
    private_ip_google_access = true
  
 # flow logs config
    enable_flow_logs     = true
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 1.0
    metadata             = "INCLUDE_ALL_METADATA"
  }
  snet-dev-app-mec2-0 = {
    subnet_name              = "snet-dev-app-mec2-0"
    region                   = "me-central2"
    ip_cidr_range            = "10.60.71.0/24"
    network                  = "dev-spoke-mec2-vpc-0"   
    private_ip_google_access = true
  
 # flow logs config
    enable_flow_logs     = true
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 1.0
    metadata             = "INCLUDE_ALL_METADATA"
  }

  snet-dev-DB-mec2-0 = {
    subnet_name              = "snet-dev-db-mec2-0"
    region                   = "me-central2"
    ip_cidr_range            = "10.60.72.0/25"
    network                  = "dev-spoke-mec2-vpc-0"   
    private_ip_google_access = true
  
 # flow logs config
    enable_flow_logs     = true
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 1.0
    metadata             = "INCLUDE_ALL_METADATA"
  }
}

# routes

routes = {

  "rt-dev-to-hub-trust-0" = {
    name        = "rt-dev-to-hub-trust-0"
    network     = "dev-spoke-mec2-vpc-0"
    next_hop_ilb = "10.60.20.34"
    dest_range  = "10.60.48.0/22"
    description = "Custom spoke routes"
  }

  "rt-dev-to-hub-trust-1" = {
    name         = "rt-dev-to-hub-trust-1"
    network      = "dev-spoke-mec2-vpc-0"
    next_hop_ilb = "10.60.20.34"
    dest_range   = "10.60.60.0/22"
    description  = "Custom spoke routes"
  }

  "rt-dev-to-hub-trust-2" = {
    name        = "rt-dev-to-hub-trust-2"
    network     = "dev-spoke-mec2-vpc-0"
    next_hop_ilb = "10.60.20.34"
    dest_range  = "10.60.80.0/24"
    description = "Custom spoke routes"
  }

  "rt-dev-to-hub-trust-3" = {
    name        = "rt-dev-to-hub-trust-3"
    network     = "dev-spoke-mec2-vpc-0"
    next_hop_ilb = "10.60.20.34"
    dest_range  = "10.60.90.0/23"
    description = "Custom spoke routes"
  }

  "rt-dev-to-hub-trust-4" = {
    name        = "rt-dev-to-hub-trust-4"
    network     = "dev-spoke-mec2-vpc-0"
    next_hop_ilb = "10.60.20.34"
    dest_range  = "10.60.100.0/25"
    description = "Custom spoke routes"
  }

#onprem and gcp
  "rt-dev-to-hub-trust-5" = {
    name        = "rt-dev-to-hub-trust-5"
    network     = "dev-spoke-mec2-vpc-0"
    next_hop_ilb = "10.60.20.34"
    dest_range  = "10.2.0.0/15"
    description = "Custom spoke routes"
  }

  "rt-dev-to-hub-trust-6" = {
    name        = "rt-dev-to-hub-trust-6"
    network     = "dev-spoke-mec2-vpc-0"
    next_hop_ilb = "10.60.20.34"
    dest_range  = "10.1.0.0/16"
    description = "Custom spoke routes"
  }

  "rt-dev-to-hub-trust-7" = {
    name        = "rt-dev-to-hub-trust-7"
    network     = "dev-spoke-mec2-vpc-0"
    next_hop_ilb = "10.60.20.34"
    dest_range  = "10.10.0.0/16"
    description = "Custom spoke routes"
  }
# gcp and internet
 "rt-dev-to-hub-trust-8" = {
    name        = "rt-dev-to-hub-trust-8"
    network     = "dev-spoke-mec2-vpc-0"
    next_hop_ilb = "10.60.20.22"
    dest_range  = "0.0.0.0/0"
    description = "Custom spoke routes"
  }

  }


# # ### firewall
 
firewall_rules = {

  fw-deny-all-ingress-prod = {
    name          = "fw-deny-all-ingress-prod"
    network       = "dev-spoke-mec2-vpc-0"
    direction     = "INGRESS"
    action        = "deny"
    protocol      = "all"
    source_ranges = ["0.0.0.0/0"]
    priority      = 65535
    description   = "Deny all incoming traffic by default"
  }
  fw-deny-all-egress-prod = {
    name               = "fw-deny-all-egress-prod"
    network            = "dev-spoke-mec2-vpc-0"
    direction          = "EGRESS"
    action             = "deny"
    protocol           = "all"
    destination_ranges = ["0.0.0.0/0"]
    priority      = 65535
    description        = "Deny all egress unless explicitly allowed"
  }
  fw-allow-iap-ssh-prod = {
    name          = "fw-allow-iap-ssh-prod"
    network       = "dev-spoke-mec2-vpc-0"
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
    network       = "dev-spoke-mec2-vpc-0"
    direction     = "INGRESS"
    action        = "allow"
    protocol      = "tcp"
    ports         = ["135", "88", "389", "3268", "445"]
    source_ranges = ["10.0.0.0/8"]
    priority      = 65535
    description   = "Member servers to connect to AD"
  }

}

