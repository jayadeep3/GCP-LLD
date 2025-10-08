# Required for VM-Series tutorial
project_id          = "ndf-network-prj-mec2-01"
public_key_path     = "~/.ssh/vmseries-tutorial.pub"
mgmt_allow_ips      = ["0.0.0.0/0"]
region              = "me-central2"
vmseries_image_name = "vmseries-flex-bundle2-1123h3"

# Optional for VM-Series tutorial
prefix              = "panw"
cidr_mgmt           = "10.0.1.0/24"
cidr_untrust        = "10.0.1.3/24"
cidr_trust          = "10.0.2.3/24"
# cidr_ha2            = "10.0.3.0/24"
create_workload_vm  = true
