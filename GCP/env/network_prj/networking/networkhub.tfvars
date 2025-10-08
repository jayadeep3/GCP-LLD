# #vpc

project_id = "test-network-prj-mec2-01"
region     = "me-central2"

vpcs = {
  "hub-untrust-mec2-vpc-0" = {
    vpc_name                = "hub-untrust-mec2-vpc-0"
    auto_create_subnetworks = false
    routing_mode            = "REGIONAL"
  }

  "hub-trust-mec2-vpc-0" = {
    vpc_name                = "hub-trust-mec2-vpc-0"
    auto_create_subnetworks = false
    routing_mode            = "REGIONAL"
  }

  "hub-mgmt-mec2-vpc-0" = {
    vpc_name                = "hub-mgmt-mec2-vpc-0"
    auto_create_subnetworks = false
    routing_mode            = "REGIONAL"
  }

  "hub-transit-mec2-vpc-0" = {
    vpc_name                = "hub-transit-mec2-vpc-0"
    auto_create_subnetworks = false
    routing_mode            = "REGIONAL"
  }

}



#subnets
# project_id = "test-networkk-prj-mec2-100"

subnets = {

 # Hub_untrust-mec2-vpc-0 subnet 
  snet-untrust-fw-mec2-0 = {
    subnet_name              = "snet-untrust-fw-mec2-0"
    region                   = "me-central2"
    ip_cidr_range            = "10.60.10.0/26"
    network                  = "hub-untrust-mec2-vpc-0"   
    private_ip_google_access = true
  
 # flow logs config
    enable_flow_logs     = true
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 1.0
    metadata             = "INCLUDE_ALL_METADATA"
  }
  
  # Hub_trust-mec2-vpc-0 subnet 
  snet-trust-pfw-mec2-0 = {
    subnet_name              = "snet-trust-pfw-mec2-0"
    region                   = "me-central2"
    ip_cidr_range            = "10.60.20.0/27"
    network                  = "hub-trust-mec2-vpc-0"   
    private_ip_google_access = true
  
 # flow logs config
    enable_flow_logs     = true
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 1.0
    metadata             = "INCLUDE_ALL_METADATA"
  }

  snet-trust-ifw-mec2-0 = {
    subnet_name              = "snet-trust-ifw-mec2-0"
    region                   = "me-central2"
    ip_cidr_range            = "10.60.20.32/27"
    network                  = "hub-trust-mec2-vpc-0"   
    private_ip_google_access = true
  
 # flow logs config
    enable_flow_logs     = true
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 1.0
    metadata             = "INCLUDE_ALL_METADATA"
  }

  snet-trust-f5-mec2-0 = {
    subnet_name              = "snet-trust-f5-mec2-0"
    region                   = "me-central2"
    ip_cidr_range            = "10.60.20.64/27"
    network                  = "hub-trust-mec2-vpc-0"   
    private_ip_google_access = true
  
 # flow logs config
    enable_flow_logs     = true
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 1.0
    metadata             = "INCLUDE_ALL_METADATA"
  }

# Hub_mgmt-mec2-vpc-0 subnet 
  
  snet-mgmt-mgmt-mec2-0 = {
    subnet_name              = "snet-mgmt-mgmt-mec2-0"
    region                   = "me-central2"
    ip_cidr_range            = "10.60.30.0/27"
    network                  = "hub-mgmt-mec2-vpc-0"   
    private_ip_google_access = true
  
 # flow logs config
    enable_flow_logs     = true
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 1.0
    metadata             = "INCLUDE_ALL_METADATA"
  }

  snet-mgmt-bastion-mec2-0 = {
    subnet_name              = "snet-mgmt-bastion-mec2-0"
    region                   = "me-central2"
    ip_cidr_range            = "10.60.30.32/27"
    network                  = "hub-mgmt-mec2-vpc-0"   
    private_ip_google_access = true
  
 # flow logs config
    enable_flow_logs     = true
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 1.0
    metadata             = "INCLUDE_ALL_METADATA"
  }

# Hub_transit-mec2-vpc-0 subnet

 snet-transit-cvpn-mec2-0 = {
    subnet_name              = "snet-transit-cvpn-mec2-0"
    region                   = "me-central2"
    ip_cidr_range            = "10.60.40.0/27"
    network                  = "hub-transit-mec2-vpc-0"   
    private_ip_google_access = true
  
 # flow logs config
    enable_flow_logs     = true
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 1.0
    metadata             = "INCLUDE_ALL_METADATA"
  }

  snet-transit-pic-mec2-0 = {
    subnet_name              = "snet-transit-pic-mec2-0"
    region                   = "me-central2"
    ip_cidr_range            = "10.60.40.32/27"
    network                  = "hub-transit-mec2-vpc-0"   
    private_ip_google_access = true
  
 # flow logs config
    enable_flow_logs     = true
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 1.0
    metadata             = "INCLUDE_ALL_METADATA"
  }

}


# # # firewall
 
firewall_rules = {

  #hub-untrust vpc
  fw-deny-all-ingress-untrust = {
    name          = "fw-deny-all-ingress-untrust"
    network       = "hub-untrust-mec2-vpc-0"
    direction     = "INGRESS"
    action        = "deny"
    protocol      = "all"
    source_ranges = ["0.0.0.0/0"]
    priority      = 65535
    description   = "Deny all incoming traffic by default"
  }
  fw-deny-all-egress-untrust = {
    name               = "fw-deny-all-egress-untrust"
    network            = "hub-untrust-mec2-vpc-0"
    direction          = "EGRESS"
    action             = "deny"
    protocol           = "all"
    destination_ranges = ["0.0.0.0/0"]
    priority      = 65535
    description        = "Deny all egress unless explicitly allowed"
  }
  fw-allow-iap-ssh-untrust = {
    name          = "fw-allow-iap-ssh-untrust"
    network       = "hub-untrust-mec2-vpc-0"
    direction     = "INGRESS"
    action        = "allow"
    protocol      = "tcp"
    ports         = ["22", "3389"]
    source_ranges = ["35.235.240.0/20"]
    target_tags   = ["iap-access"]
    priority      = 65535
    description   = "Allow SSH/RDP via IAP"
  }
  fw-aadc-allow-untrust = {
    name          = "fw-aadc-allow-untrust"
    network       = "hub-untrust-mec2-vpc-0"
    direction     = "INGRESS"
    action        = "allow"
    protocol      = "tcp"
    ports         = ["135", "88", "389", "3268", "445"]
    source_ranges = ["10.0.0.0/8"]
    priority      = 65535
    description   = "Member servers to connect to AD"
  }
#hub-trust vpc
 fw-deny-all-ingress-trust = {
    name          = "fw-deny-all-ingress-trust"
    network       = "hub-trust-mec2-vpc-0"
    direction     = "INGRESS"
    action        = "deny"
    protocol      = "all"
    source_ranges = ["0.0.0.0/0"]
    priority      = 65535
    description   = "Deny all incoming traffic by default"
  }
  fw-deny-all-egress-trust = {
    name               = "fw-deny-all-egress-trust"
    network            = "hub-trust-mec2-vpc-0"
    direction          = "EGRESS"
    action             = "deny"
    protocol           = "all"
    destination_ranges = ["0.0.0.0/0"]
    priority      = 65535
    description        = "Deny all egress unless explicitly allowed"
  }
  fw-allow-iap-ssh-trust = {
    name          = "fw-allow-iap-ssh-trust"
    network       = "hub-trust-mec2-vpc-0"
    direction     = "INGRESS"
    action        = "allow"
    protocol      = "tcp"
    ports         = ["22", "3389"]
    source_ranges = ["35.235.240.0/20"]
    target_tags   = ["iap-access"]
    priority      = 65535
    description   = "Allow SSH/RDP via IAP"
  }
  fw-aadc-allow-trust = {
    name          = "fw-aadc-allow-trust"
    network       = "hub-trust-mec2-vpc-0"
    direction     = "INGRESS"
    action        = "allow"
    protocol      = "tcp"
    ports         = ["135", "88", "389", "3268", "445"]
    source_ranges = ["10.0.0.0/8"]
    priority      = 65535
    description   = "Member servers to connect to AD"
  }

# hub-mgmt vpc
 fw-deny-all-ingress-mgmt = {
    name          = "fw-deny-all-ingress-mgmt"
    network       = "hub-mgmt-mec2-vpc-0"
    direction     = "INGRESS"
    action        = "deny"
    protocol      = "all"
    source_ranges = ["0.0.0.0/0"]
    priority      = 65535
    description   = "Deny all incoming traffic by default"
  }
  fw-deny-all-egress-mgmt = {
    name               = "fw-deny-all-egress-mgmt"
    network            = "hub-mgmt-mec2-vpc-0"
    direction          = "EGRESS"
    action             = "deny"
    protocol           = "all"
    destination_ranges = ["0.0.0.0/0"]
    priority      = 65535
    description        = "Deny all egress unless explicitly allowed"
  }
  fw-allow-iap-ssh-mgmt = {
    name          = "fw-allow-iap-ssh-mgmt"
    network       = "hub-mgmt-mec2-vpc-0"
    direction     = "INGRESS"
    action        = "allow"
    protocol      = "tcp"
    ports         = ["22", "3389"]
    source_ranges = ["35.235.240.0/20"]
    target_tags   = ["iap-access"]
    priority      = 65535
    description   = "Allow SSH/RDP via IAP"
  }
  fw-aadc-allow-mgmt = {
    name          = "fw-aadc-allow-mgmt"
    network       = "hub-mgmt-mec2-vpc-0"
    direction     = "INGRESS"
    action        = "allow"
    protocol      = "tcp"
    ports         = ["135", "88", "389", "3268", "445"]
    source_ranges = ["10.0.0.0/8"]
    priority      = 65535
    description   = "Member servers to connect to AD"
  }


# hub-transit vpc
 fw-deny-all-ingress-transit = {
    name          = "fw-deny-all-ingress-transit"
    network       = "hub-transit-mec2-vpc-0"
    direction     = "INGRESS"
    action        = "deny"
    protocol      = "all"
    source_ranges = ["0.0.0.0/0"]
    priority      = 65535
    description   = "Deny all incoming traffic by default"
  }
  fw-deny-all-egress-transit = {
    name               = "fw-deny-all-egress-transit"
    network            = "hub-transit-mec2-vpc-0"
    direction          = "EGRESS"
    action             = "deny"
    protocol           = "all"
    destination_ranges = ["0.0.0.0/0"]
    priority      = 65535
    description        = "Deny all egress unless explicitly allowed"
  }
  fw-allow-iap-ssh-transit = {
    name          = "fw-allow-iap-ssh-transit"
    network       = "hub-transit-mec2-vpc-0"
    direction     = "INGRESS"
    action        = "allow"
    protocol      = "tcp"
    ports         = ["22", "3389"]
    source_ranges = ["35.235.240.0/20"]
    target_tags   = ["iap-access"]
    priority      = 65535
    description   = "Allow SSH/RDP via IAP"
  }
  fw-aadc-allow-transit = {
    name          = "fw-aadc-allow-transit"
    network       = "hub-transit-mec2-vpc-0"
    direction     = "INGRESS"
    action        = "allow"
    protocol      = "tcp"
    ports         = ["135", "88", "389", "3268", "445"]
    source_ranges = ["10.0.0.0/8"]
    priority      = 65535
    description   = "Member servers to connect to AD"
  }
}

routers = {
  untrust_router = {
    name = "ndf-untrust-net-router-0"
    network = "hub-untrust-mec2-vpc-0"
    region = "me-central2"
  }

  transit_router = {
    name = "ndf-transit-net-router-0"
    network = "hub-transit-mec2-vpc-0"
    region = "me-central2"
  }
  
}

nats = {
  "nat-untrust-net-prj-0" = {
    name                            = "nat-untrust-net-prj-0"
    region                          = "me-central2"
    router                          = "ndf-untrust-net-router-0"
    nat_ip_allocate_option          = "AUTO_ONLY"
    source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  }
}

# # # internal-lb


# # project_id = "ndf-network-prj-mec2-0"
# # region     = "me-central2"
 
internal_lbs = {
  pfw-ilb = {
    name       = "ilb-nw-int-reg-net-pfw"
    region     = "me-central2"
    network    = "hub-trust-mec2-vpc-0"
    subnetwork = "snet-trust-pfw-mec2-0"
    ip_address = "10.60.20.22"
    labels = {
      environment = "hub"
      owner       = "test"
      app         = "test"
      department  = "test-networking"
      service_type = "lb"
    }
}
  ifw-ilb = {
    name       = "ilb-nw-int-reg-net-ifw"
    region     = "me-central2"
    network    = "hub-trust-mec2-vpc-0"
    subnetwork = "snet-trust-ifw-mec2-0"
    ip_address = "10.60.20.34"
    labels = {
      environment = "hub"
      owner       = "test"
      app         = "test"
      department  = "test-networking"
      service_type = "lb"
    }
  }
}

# #dns

managed_zones = {
  # internal-zone = {
  #   name       = "internal-zone"
  #   dns_name   = "internal.example."
  #   visibility = "private"
  #   labels  = {
  #     environment = "hub"
  #     owner       = "test"
  #     app         = "test"
  #     department  = "test-networking"
  #     service_type = "dns"
  #   }
  # }

  public-zone = {
    name  = "private-internal"
    dns_name   = "internal.example."
    visibility = "private"
    labels  = {
      environment = "hub"
      owner       = "test"
      app         = "test"
      department  = "test-networking"
      service_type = "dns"
    }
  }
}

records = {
  # www_record = {
  #   name         = "www.internal.example.com."
  #   type         = "A"
  #   ttl          = 300
  #   managed_zone = "publ"
  #   rrdatas      = ["10.0.0.10"]
  # }

  api_record = {
    name         = "api.internal.example."
    type         = "CNAME"
    ttl          = 300
    managed_zone = "private-internal"
    rrdatas      = ["app.internal.example."]
  }
}

# ha_vpns = {
#    gateway_name = "ha-vpn-gateway-transit-mec2"
#    network = "hub-transit-mec2-vpc-0"
#    region = "me-central2"
# }

# ha_vpn_tunnels = {
#   tunnel_name     = "stc-transit-mec2"
#     region        = "me-central2"
#     gateway       = "stc-transit-gateway-mec2"
#     interface     = 2
#     peer_ip       = "103.53.63.77"
#     shared_secret = "xyz3457"
#     router        = "transit_router"
# }


