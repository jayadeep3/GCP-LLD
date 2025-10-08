#vpc

project_id = "ndf-pp-prj-mec2-01"
region     = "me-central2"

vpcs = {
  "pp-spoke-mec2-vpc-0" = {
    vpc_name                = "pp-spoke-mec2-vpc-0"
    auto_create_subnetworks = false
    routing_mode            = "REGIONAL"
  }

  "pp-dmz-spoke-mec2-vpc-0" = {
    vpc_name                = "pp-dmz-spoke-mec2-vpc-0"
    auto_create_subnetworks = false
    routing_mode            = "REGIONAL"
  }
}

# #subnets

# project_id = "ndf-pp-prj-mec2-0"

subnets = {

  snet-pre-prod-web-mec2-0 = {
    subnet_name              = "snet-pre-prod-web-mec2-0"
    region                   = "me-central2"
    ip_cidr_range            = "10.60.60.0/24"
    network                  = "pp-spoke-mec2-vpc-0"   
    private_ip_google_access = true
  
 # flow logs config
    enable_flow_logs     = true
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 1.0
    metadata             = "INCLUDE_ALL_METADATA"
  }
  
  snet-pre-prod-app-mec2-0 = {
    subnet_name              = "snet-pre-prod-app-mec2-0"
    region                   = "me-central2"
    ip_cidr_range            = "10.60.61.0/24"
    network                  = "pp-spoke-mec2-vpc-0"   
    private_ip_google_access = true
  
 # flow logs config
    enable_flow_logs     = true
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 1.0
    metadata             = "INCLUDE_ALL_METADATA"
  }

  snet-pre-prod-DB-mec2-0 = {
    subnet_name              = "snet-pre-prod-db-mec2-0"
    region                   = "me-central2"
    ip_cidr_range            = "10.60.62.0/25"
    network                  = "pp-spoke-mec2-vpc-0"   
    private_ip_google_access = true
  
 # flow logs config
    enable_flow_logs     = true
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 1.0
    metadata             = "INCLUDE_ALL_METADATA"
  }

   snet-pp-dmz-web-mec2-0 = {
    subnet_name              = "snet-pp-dmz-web-mec2-0"
    region                   = "me-central2"
    ip_cidr_range            = "10.60.91.0/25"
    network                  = "pp-dmz-spoke-mec2-vpc-0"   
    private_ip_google_access = true
  
 # flow logs config
    enable_flow_logs     = true
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 1.0
    metadata             = "INCLUDE_ALL_METADATA"
  }

  snet-pp-dmz-integeration-mec2-0 = {
    subnet_name              = "snet-pp-dmz-integeration-mec2-0"
    region                   = "me-central2"
    ip_cidr_range            = "10.60.91.128/25"
    network                  = "pp-dmz-spoke-mec2-vpc-0"   
    private_ip_google_access = true
  
 # flow logs config
    enable_flow_logs     = true
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 1.0
    metadata             = "INCLUDE_ALL_METADATA"
  }
}

# # routes

# project_id = "ndf-pp-prj-mec2-0"

routes = {

  "rt-pp-to-hub-trust-0" = {
    name        = "rt-pp-to-hub-trust-0"
    network     = "pp-spoke-mec2-vpc-0"
    next_hop_ilb = "10.60.20.34"
    dest_range  = "10.60.48.0/21"
    description = "Custom spoke routes"
  }

  "rt-pp-to-hub-trust-1" = {
    name        = "rt-pp-to-hub-trust-1"
    network     = "pp-spoke-mec2-vpc-0"
    next_hop_ilb = "10.60.20.34"
    dest_range  = "10.60.68.0/22"
    description = "Custom spoke routes"
  }

  "rt-pp-to-hub-trust-2" = {
    name        = "rt-pp-to-hub-trust-2"
    network     = "pp-spoke-mec2-vpc-0"
    next_hop_ilb = "10.60.20.34"
    dest_range  = "10.60.72.0/22"
    description = "Custom spoke routes"
  }

  "rt-pp-to-hub-trust-3" = {
    name        = "rt-pp-to-hub-trust-3"
    network     = "pp-spoke-mec2-vpc-0"
    next_hop_ilb = "10.60.20.34"
    dest_range  = "10.60.80.0/24"
    description = "Custom spoke routes"
  }

  "rt-pp-to-hub-trust-4" = {
    name        = "rt-pp-to-hub-trust-4"
    network     = "pp-spoke-mec2-vpc-0"
    next_hop_ilb = "10.60.20.34"
    dest_range  = "10.60.90.0/23"
    description = "Custom spoke routes"
  }

  "rt-pp-to-hub-trust-5" = {
    name        = "rt-pp-to-hub-trust-5"
    network     = "pp-spoke-mec2-vpc-0"
    next_hop_ilb = "10.60.20.34"
    dest_range  = "10.60.100.0/25"
    description = "Custom spoke routes"
  }
 
#gcp and onprem
  "rt-pp-to-hub-trust-6" = {
    name        = "rt-pp-to-hub-trust-6"
    network     = "pp-spoke-mec2-vpc-0"
    next_hop_ilb = "10.60.20.34"
    dest_range  = "10.60.80.0/24"
    description = "Custom spoke routes"
  }

  "rt-pp-to-hub-trust-7" = {
    name        = "rt-pp-to-hub-trust-7"
    network     = "pp-spoke-mec2-vpc-0"
    next_hop_ilb = "10.60.20.34"
    dest_range  = "10.60.90.0/23"
    description = "Custom spoke routes"
  }

  "rt-pp-to-hub-trust-8" = {
    name        = "rt-pp-to-hub-trust-8"
    network     = "pp-spoke-mec2-vpc-0"
    next_hop_ilb = "10.60.20.34"
    dest_range  = "10.60.100.0/25"
    description = "Custom spoke routes"
  }
 # gcp and internet

 "rt-pp-to-hub-trust-9" = {
    name        = "rt-pp-to-hub-trust-9"
    network     = "pp-spoke-mec2-vpc-0"
    next_hop_ilb = "10.60.20.22"
    dest_range  = "0.0.0.0/0"
    description = "Custom spoke routes"
  }
}



# # firewall
 
firewall_rules = {

  fw-deny-all-ingress-prod = {
    name          = "fw-deny-all-ingress-prod"
    network       = "pp-spoke-mec2-vpc-0"
    direction     = "INGRESS"
    action        = "deny"
    protocol      = "all"
    source_ranges = ["0.0.0.0/0"]
    priority      = 65535
    description   = "Deny all incoming traffic by default"
  }
  fw-deny-all-egress-prod = {
    name               = "fw-deny-all-egress-prod"
    network            = "pp-spoke-mec2-vpc-0"
    direction          = "EGRESS"
    action             = "deny"
    protocol           = "all"
    destination_ranges = ["0.0.0.0/0"]
    priority      = 65535
    description        = "Deny all egress unless explicitly allowed"
  }
  fw-allow-iap-ssh-prod = {
    name          = "fw-allow-iap-ssh-prod"
    network       = "pp-spoke-mec2-vpc-0"
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
    network       = "pp-spoke-mec2-vpc-0"
    direction     = "INGRESS"
    action        = "allow"
    protocol      = "tcp"
    ports         = ["135", "88", "389", "3268", "445"]
    source_ranges = ["10.0.0.0/8"]
    priority      = 65535
    description   = "Member servers to connect to AD"
  }

}