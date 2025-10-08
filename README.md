# GCP-LLD
GCP Landing Zone Implementation


GCP/
├── env/                                  # Environment-specific configs (per project)
│   ├── billing-prj/                      # Billing project (BigQuery, Billing export)
        └── main.tf
        └── variables.tf
        └── provider.tf
        └── terraform.tfvars
│   ├── network-prj/                      # Central networking project
        ├── IAM/                          # Folder + policies for this project
            ├── bindings/            
                └── main.tf
                └── variables.tf
                └── provider.tf
                └── bindings.tfvars
        ├── networking/                   # Core networking resources
            └── main.tf
            └── variables.tf
            └── provider.tf
            └── networkhub.tfvars
            └── versions.tf                        
│   │   └── Security/                     # Security for resources
            └── main.tf
            └── variables.tf
            └── provider.tf
            └── terraform.tfvars
│   ├── infraservices-prj/                # Central networking project
        ├── networking/                   # Core networking resources
            └── main.tf
            └── variables.tf
            └── provider.tf
            └── networkhub.tfvars
            └── versions.tf                        
│   │   └── Security/                     # Security for resources
            └── main.tf
            └── variables.tf
            └── provider.tf
            └── terraform.tfvars
│   ├── prod-prj/                         # Production application project
│   │   ├── IAM/                          # Folder + policies for this project
            ├── bindings/            
                └── main.tf
                └── variables.tf
                └── provider.tf
                └── bindings.tfvars
        ├── networking/                   # Core networking resources
            └── main.tf
            └── variables.tf
            └── provider.tf
            └── prod.tfvars
            └── versions.tf                        
│   │   └── Security/                     # Security for resources
            └── main.tf
            └── variables.tf
            └── provider.tf
            └── terraform.tfvars
│   ├── dev-prj/
│   │   ├── IAM/                          # Folder + policies for this project
            ├── bindings/            
                └── main.tf
                └── variables.tf
                └── provider.tf
                └── bindings.tfvars
        ├── networking/                   # Core networking resources
            └── main.tf
            └── variables.tf
            └── provider.tf
            └── dev.tfvars
            └── versions.tf                        
│   │   ├── Security/                     # Security for resources
            └── main.tf
            └── variables.tf
            └── provider.tf
            └── terraform.tfvars
│   ├── preprod-prj/
        ├── IAM/                          # Folder + policies for this project
            ├── bindings/            
                └── main.tf
                └── variables.tf
                └── provider.tf
                └── bindings.tfvars
        ├── networking/                   # Core networking resources
            └── main.tf
            └── variables.tf
            └── provider.tf
            └── preprod.tfvars
            └── versions.tf                        
│   │   ├── Security/                     # Security for resources
            └── main.tf
            └── variables.tf
            └── provider.tf
            └── terraform.tfvars
│   ├── security-prj/                     # Security project (SIEM, threat mgmt)
        ├── IAM/                          # Folder + policies for this project
            ├── bindings/            
                └── main.tf
                └── variables.tf
                └── provider.tf
                └── bindings.tfvars
        ├── networking/                   # Core networking resources
            └── main.tf
            └── variables.tf
            └── provider.tf
            └── security.tfvars
            └── versions.tf        
    ├── logging-prj/                      # Logging + monitoring project
│   │   ├── services/
│   │   │   ├── logging/                  # Logging sinks + configs
                └── main.tf
                └── variables.tf
                └── provider.tf
                └── terraform.tfvars
│   │   │   ├── monitoring/               # Monitoring + alerting
                └── main.tf
                └── variables.tf
                └── provider.tf
                └── terraform.tfvars
│   │       ├── iam/
    ├── sbx-prj/                          # Sandbox project (for testing)
    ├── iac-prj/                          # infrastructure project (for service accounts and WIF)
    ├── org_policies/
        └── main.tf
        └── variables.tf
        └── provider.tf
        └── terraform.tfvars
├── stack/                                # Logical grouping of modules (execution entrypoints)
│   ├── org-foundation/                   # Calls projects modules
│   │   ├── main.tf                       # Module calls (projects)
│   │   ├── providers.tf                  # Provider config
│   │   ├── variables.tf                  # Input variable definitions
│   │   └── versions.tf                   # Provider + TF version constraints
|   ├── org-bootstrap/                    # Calls organization level folder modules
|       ├── org-bootstrap-subfolders/     # Calls organization level subfolders modules
|       |   ├── main.tf                   # Module calls (subfolders)
|       |   ├── variables.tf              # Input variable definitions
            ├── versions.tf               # Provider + TF version constraints
|       |   ├── outputs.tf                # outputs to see the subfolder id's
            ├── providers.tf              # Provider config          
│   │   ├── main.tf                       # Module calls (folders)      
│   │   ├── providers.tf                  # Provider config       
│   │   ├── variables.tf                  # Input variable definitions      
│   │   └── versions.tf                   # Provider + TF version constraints
        └── outputs.tf                    # outputs to see the folder id's
│
├── modules/                              # Reusable building blocks 
│   ├── networking/                       # All networking grouped
│   │   ├── vpc/                          # Creates VPCs
│   │   ├── subnets/                      # Creates subnets
│   │   ├── firewall/                     # Firewall rules
│   │   ├── routes/                       # Routes
│   │   ├── routers/                      # Cloud Routers
│   │   ├── nat/                          # NAT gateways
│   │   ├── vpn/                          # VPN tunnels
│   │   ├── lbs/                          # Load Balancers
│   │   ├── dns/                          # DNS Servers
│   │   ├── vpc_peering/                  # VPC Peering
│   ├── folders/                          # Folder structure
│   ├── projects/                         # Project creation
│   ├── billing/                          # Cloud Billing
│   ├── logging/                          # Logging sinks
│   ├── monitoring/                       # Monitoring policies
│   ├── iam/                              # IAM roles + bindings
│   ├── security/                         # Security cmek keys
│   └── org_policies/                     # Organization Policies
