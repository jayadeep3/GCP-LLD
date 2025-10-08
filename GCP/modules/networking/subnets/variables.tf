variable "project_id" {
  type = string
}


variable "subnets" {
  type = map(object({
    subnet_name              = string
    ip_cidr_range            = string   
    region                   = string
    vpc_self_link            = string
    private_ip_google_access = bool

    # flow logs config
    enable_flow_logs     = optional(bool, false)
    aggregation_interval = optional(string, "INTERVAL_5_SEC")
    flow_sampling        = optional(number, 0.5)
    metadata             = optional(string, "INCLUDE_ALL_METADATA")
  }))
}

