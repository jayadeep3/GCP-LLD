project_id  = "test-logging-prj-mec2-01"
region      =   "me-central2"
 
monitored_projects = [
  "test-network-prj-mec2-01",
  "test-infraservices-prj-mec2-01",
  "test-prod-prj-mec2-01",
  "test-security-prj-mec2-01"
]
 
notif_channels = {
  "ops-email" = {
    type   = "email"
    labels = { email_address = "ops@example.com" }
  }
}
 
alert_policies = {
  instance_uptime = {
    display_name  = "TEST Compute Instance Uptime check"
    metric_type   = "compute.googleapis.com/instance/uptime"
    resource_type = "gce_instance"
    threshold     = 300  # less than 5 minutes
    aligner       = "ALIGN_DELTA"
    user_labels   = {
      environment  = "test"
      owner        = "test-team"
      app          = "test"
      department   = "test"
      service_type = "monitoring"
    }
    metric_labels   = {}
  }
  disk_read_ops = {
    display_name  = "TEST Compute Disk Read Ops"
    metric_type   = "compute.googleapis.com/instance/disk/read_ops_count"
    resource_type = "gce_instance"
    threshold     = 1000
    aligner       = "ALIGN_RATE"
    user_labels   = {
      environment  = "test"
      owner        = "test-team"
      app          = "test"
      department   = "test  "
      service_type = "monitoring"
    }
    metric_labels   = {}
  }
 
  disk_write_ops = {
    display_name  = "TEST Compute Disk Write Ops"
    metric_type   = "compute.googleapis.com/instance/disk/write_ops_count"
    resource_type = "gce_instance"
    threshold     = 1000
    aligner       = "ALIGN_RATE"
    user_labels   = {
      environment  = "test"
      owner        = "test-team"
      app          = "test"
      department   = "test"
      service_type = "monitoring"
    }
    metric_labels   = {}
  }
 
  total_bytes = {
    display_name  = "TEST Cloud Storage Usage"
    metric_type   = "storage.googleapis.com/storage/total_bytes"
    resource_type = "gcs_bucket"
    threshold     = 1e12   # 1 TB
    aligner       = "ALIGN_MEAN"
    user_labels   = {
      environment  = "test"
      owner        = "test-team"
      app          = "test"
      department   = "test"
      service_type = "monitoring"
    }
    metric_labels   = {}
  }
 
  firewall_dropped_packets = {
    display_name  = "TEST Firewall Dropped Packets"
    metric_type   = "compute.googleapis.com/firewall/dropped_packets_count"
    resource_type = "gce_instance"
    threshold     = 100
    aligner       = "ALIGN_RATE"
    user_labels   = {
      environment  = "test"
      owner        = "test-team"
      app          = "test"
      department   = "test"
      service_type = "monitoring"
    }
    metric_labels   = {}
  }
 
  vpn_tunnel_status = {
    display_name  = "TEST VPN Tunnel Established"
    metric_type   = "vpn.googleapis.com/tunnel_established"
    resource_type = "vpn_gateway"
    threshold     = 0   # 0 = not established
    aligner       = "ALIGN_MEAN"
    user_labels   = {
      environment  = "test"
      owner        = "test-team"
      app          = "test"
      department   = "test"
      service_type = "monitoring"
    }
    metric_labels   = {}
  }
 
  bgp_session_status = {
    display_name  = "TEST Router BGP Session Status"
    metric_type   = "router.googleapis.com/bgp/session_up"
    resource_type = "gce_router"
    threshold     = 0   # 0 = not established
    aligner       = "ALIGN_MEAN"
    user_labels   = {
      environment  = "test"
      owner        = "test-team"
      app          = "test"
      department   = "test"
      service_type = "monitoring"
    }
    metric_labels   = {}
  }
 
  # lb_connection_limit = {
  #   display_name    = "TEST LB Connection Limit Reached"
  #   metric_type     = "loadbalancing.googleapis.com/https/connection_limit_reached"
  #   resource_type   = "https_lb_rule"
  #   threshold       = 1
  #   aligner         = "ALIGN_RATE"
  #   resource_labels = { project_id = "PROJECT_ID" }
  #   metric_labels   = { response_code_class = "5xx" }
  # }
 
  # lb_connection_refused = {
  #   display_name    = "TEST LB Connection Refused"
  #   metric_type     = "loadbalancing.googleapis.com/https/connection_refused"
  #   resource_type   = "https_lb_rule"
  #   threshold       = 1
  #   aligner         = "ALIGN_RATE"
  #   resource_labels = { project_id = "PROJECT_ID" }
  #   metric_labels   = {}
  # }
 
  # lb_dns_error = {
  #   display_name    = "TEST LB DNS Errors"
  #   metric_type     = "loadbalancing.googleapis.com/https/dns_error"
  #   resource_type   = "https_lb_rule"
  #   threshold       = 1
  #   aligner         = "ALIGN_RATE"
  #   resource_labels = { project_id = "PROJECT_ID" }
  #   metric_labels   = {}
  # }
 
  # lb_http_protocol_error = {
  #   display_name    = "TEST LB HTTP Protocol Errors"
  #   metric_type     = "loadbalancing.googleapis.com/https/http_protocol_error"
  #   resource_type   = "https_lb_rule"
  #   threshold       = 1
  #   aligner         = "ALIGN_RATE"
  #   resource_labels = { project_id = "PROJECT_ID" }
  #   metric_labels   = { protocol = "HTTP" }
  # }
 
  lb_backend_request_count = {
    display_name    = "TEST LB Backend Request Count"
    metric_type     = "loadbalancing.googleapis.com/https/backend_request_count"
    resource_type   = "https_lb_rule"
    threshold       = 1000
    aligner         = "ALIGN_RATE"
    user_labels   = {
      environment  = "test"
      owner        = "test-team"
      app          = "test"
      department   = "test"
      service_type = "monitoring"
    }
    metric_labels   = { backend_name = "lb-backend" }
  }
 
  # lb_backend_response_latencies = {
  #   display_name    = "TEST LB Backend Response Latency"
  #   metric_type     = "loadbalancing.googleapis.com/https/backend_response_latencies"
  #   resource_type   = "https_lb_rule"
  #   threshold       = 1000 # ms
  #   aligner         = "ALIGN_MEAN"
  #   user_labels   = {
  #     environment  = "test"
  #     owner        = "test-team"
  #     app          = "test"
  #     department   = "test  "
  #     service_type = "monitoring"
  #   }
  #   metric_labels   = { backend_name = "default-backend" }
  # }
 
  lb_request_count = {
    display_name    = "TEST LB Request Count"
    metric_type     = "loadbalancing.googleapis.com/https/request_count"
    resource_type   = "https_lb_rule"
    threshold       = 1000
    aligner         = "ALIGN_RATE"
    user_labels   = {
      environment  = "test"
      owner        = "test-team"
      app          = "test"
      department   = "test  "
      service_type = "monitoring"
    }
    metric_labels   = {}
  }

  lb_latency = {
    display_name    = "TEST LB Latency"
    metric_type     = "loadbalancing.googleapis.com/https/total_latencies"
    resource_type   = "https_lb_rule"
    threshold       = 1000 # ms
    aligner         = "ALIGN_PERCENTILE_95"
    user_labels   = {
      environment  = "test"
      owner        = "test-team"
      app          = "test"
      department   = "test"
      service_type = "monitoring"
    }
    metric_labels   = {}
  }

  lb_backend_latencies = {
    display_name    = "TEST LB Backend Latencies"
    metric_type     = "loadbalancing.googleapis.com/https/backend_latencies"
    resource_type   = "https_lb_rule"
    threshold       = 1000 # ms
    aligner         = "ALIGN_PERCENTILE_95"
    user_labels   = {
      environment  = "test"
      owner        = "test-team"
      app          = "test"
      department   = "test"
      service_type = "monitoring"
    }
    metric_labels   = {}
  }

  lb_5xx_count = {
    display_name    = "TEST LB 5xx Errors Count"
    metric_type     = "network.googleapis.com/loadbalancer/backend/error_rate"
    resource_type   = "load_balancer_backend"
    threshold       = 10
    aligner         = "ALIGN_MEAN"
    user_labels   = {
      environment  = "test"
      owner        = "test-team"
      app          = "test"
      department   = "test"
      service_type = "monitoring"
    }
    metric_labels   = {}
  }

  lb_backend_request_count = {
    display_name    = "TEST LB Backend Request Count"
    metric_type     = "loadbalancing.googleapis.com/https/backend_request_count"
    resource_type   = "https_lb_rule"
    threshold       = 1000
    aligner         = "ALIGN_RATE"
    user_labels   = {
      environment  = "test"
      owner        = "test-team"
      app          = "test"
      department   = "test"
      service_type = "monitoring"
    }
    metric_labels   = {}
  }
 
  # lb_latency = {
  #   display_name    = "TEST LB Latency"
  #   metric_type     = "loadbalancing.googleapis.com/https/total_latencies"
  #   resource_type   = "https_lb_rule"
  #   threshold       = 1000 # ms
  #   aligner         = "ALIGN_MEAN"
  #   user_labels   = {
  #     environment  = "test"
  #     owner        = "test-team"
  #     app          = "test"
  #     department   = "test  "
  #     service_type = "monitoring"
  #   }
  #   metric_labels   = {}
  # }
 
  # lb_backend_latencies = {
  #   display_name    = "TEST LB Backend Latencies"
  #   metric_type     = "loadbalancing.googleapis.com/https/backend_latencies"
  #   resource_type   = "https_lb_rule"
  #   threshold       = 1000 # ms
  #   aligner         = "ALIGN_MEAN"
  #   user_labels   = {
  #     environment  = "test"
  #     owner        = "test-team"
  #     app          = "test"
  #     department   = "test  "
  #     service_type = "monitoring"
  #   }
  #   metric_labels   = { backend_name = "lb-backend" }
  # }
 
  # lb_5xx_count = {
  #   display_name    = "TEST LB 5xx Errors Count"
  #   metric_type     = "network.googleapis.com/loadbalancer/backend/error_rate"
  #   resource_type   = "load_balancer_backend"
  #   threshold       = 10
  #   aligner         = "ALIGN_RATE"
  #   user_labels   = {
  #     environment  = "test"
  #     owner        = "test-team"
  #     app          = "test"
  #     department   = "test  "
  #     service_type = "monitoring"
  #   }
  #   metric_labels   = { response_code_class = "5xx" }
  # }
 
  # lb_failed_requests = {
  #   display_name    = "TEST LB Failed Requests"
  #   metric_type     = "loadbalancing.googleapis.com/https/failed_requests"
  #   resource_type   = "https_lb_rule"
  #   threshold       = 10
  #   aligner         = "ALIGN_RATE"
  #   user_labels   = {
  #     environment  = "test"
  #     owner        = "test-team"
  #     app          = "test"
  #     department   = "test  "
  #     service_type = "monitoring"
  #   }
  #   metric_labels   = {}
  # }
 
  # lb_backend_unavailable = {
  #   display_name    = "TEST LB Backend Unavailable"
  #   metric_type     = "loadbalancing.googleapis.com/https/backend_unavailable_count"
  #   resource_type   = "https_lb_rule"
  #   threshold       = 1
  #   aligner         = "ALIGN_RATE"
  #   user_labels   = {
  #     environment  = "test"
  #     owner        = "test-team"
  #     app          = "test"
  #     department   = "test  "
  #     service_type = "monitoring"
  #   }
  #   metric_labels   = { backend_name = "default-backend" }
  # }
 
  # lb_health_check = {
  #   display_name    = "TEST LB Backend Health Check Failed"
  #   metric_type     = "loadbalancing.googleapis.com/https/backend_health_check_status"
  #   resource_type   = "https_lb_rule"
  #   threshold       = 0
  #   aligner         = "ALIGN_MEAN"
  #   user_labels   = {
  #     environment  = "test"
  #     owner        = "test-team"
  #     app          = "test"
  #     department   = "test  "
  #     service_type = "monitoring"
  #   }
  #   metric_labels   = { backend_name = "default-backend" }
  # }
 
  # --- Cloud Storage ---
  # gcs_4xx_errors = {
  #   display_name    = "TEST GCS 4xx Errors"
  #   metric_type     = "storage.googleapis.com/storage/errors/4xx"
  #   resource_type   = "gcs_bucket"
  #   threshold       = 10
  #   aligner         = "ALIGN_RATE"
  #   user_labels   = {
  #     environment  = "test"
  #     owner        = "test-team"
  #     app          = "test"
  #     department   = "test  "
  #     service_type = "monitoring"
  #   }
  #   metric_labels   = { response_code_class = "4xx" }
  # }
 
  # gcs_5xx_errors = {
  #   display_name    = "TEST GCS 5xx Errors"
  #   metric_type     = "storage.googleapis.com/storage/errors/5xx"
  #   resource_type   = "gcs_bucket"
  #   threshold       = 1
  #   aligner         = "ALIGN_RATE"
  #   user_labels   = {
  #     environment  = "test"
  #     owner        = "test-team"
  #     app          = "test"
  #     department   = "test  "
  #     service_type = "monitoring"
  #   }
  #   metric_labels   = { response_code_class = "5xx" }
  # }
 
  # gcs_latency = {
  #   display_name    = "TEST GCS Latency"
  #   metric_type     = "storage.googleapis.com/api/request_latencies"
  #   resource_type   = "gcs_bucket"
  #   threshold       = 1000
  #   aligner         = "ALIGN_MEAN"
  #   user_labels   = {
  #     environment  = "test"
  #     owner        = "test-team"
  #     app          = "test"
  #     department   = "test  "
  #     service_type = "monitoring"
  #   }
  #   metric_labels   = {}
  # }
 
  # --- Cloud NAT ---
  # nat_connection_count = {
  #   display_name    = "TEST NAT Connections"
  #   metric_type     = "nat.googleapis.com/forwarding_rules/connection_count"
  #   resource_type   = "nat_gateway"
  #   threshold       = 100000
  #   aligner         = "ALIGN_RATE"
  #   user_labels   = {
  #     environment  = "test"
  #     owner        = "test-team"
  #     app          = "test"
  #     department   = "test  "
  #     service_type = "monitoring"
  #   }
  #   metric_labels   = { forwarding_rule = "rule-1" }
  # }

}
