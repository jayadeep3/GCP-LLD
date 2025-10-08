variable "project_id" {
  type        = string
  description = "Project ID where routes should be created"
}


variable "routes" {
  type = map(object({
    name             = string
    network          = string
    dest_range       = string
    next_hop_ip      = optional(string)
    next_hop_ilb     = optional(string)
    next_hop_gateway = optional(string)
    priority         = optional(number)
    description      = optional(string)
  }))
}


# variable "routes" {
#   # Description of the variable's purpose
#   description = "Map: route => { network, dest_range, next_hop_* }"

#   # Define the variable as a map of objects
#   type = map(object({
#     route_project_id  = string                    # Project ID where the route will be created
#     network           = string                    # VPC network name
#     dest_range        = string                    # Destination IP range for the route

#     next_hop_gateway  = optional(string)          # Optional: next hop gateway (e.g., default internet gateway)
#     next_hop_instance = optional(string)          # Optional: next hop instance (must be in same zone)
#     next_hop_ip       = optional(string)          # Optional: next hop IP address
#     next_hop_ilb      = optional(string)          # Optional: next hop internal load balancer

#     priority          = optional(number, 1000)    # Optional: route priority (default is 1000)
#     tags              = optional(list(string), [])# Optional: list of instance tags for route matching
#   }))

#   # Default value is an empty map
#   default = {}
# }














