terraform {

  # We recommend using a remote backend
  # More info: https://www.terraform.io/language/settings/backends
  # 
  # backend "s3" {
  # 
  # }

  # backend "gcs" {
  # ...
  # }

  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

module "osmosis-rpc" {
  source = "../../modules/digitalocean/rpc"

  name   = "osmosis-single-rpc"
  nodes  = 1
  region = "nyc3"
  tags   = ["osmosis", "fullnode"]

  # This is the recommended size for mainnet
  # Find others slugs with: `doctl compute size list`"
  size = "m3-4vcpu-32gb"
}

resource "digitalocean_floating_ip" "this" {
  region = "nyc3"
}

resource "digitalocean_floating_ip_assignment" "this" {
  ip_address = digitalocean_floating_ip.this.ip_address
  droplet_id = module.osmosis-rpc.droplets_ids[0]
}

# ------------------------------------------------------------
# Outputs
# ------------------------------------------------------------

output "ips" {
  value       = module.osmosis-rpc.droplets_ips
  description = "Droplet ips"
}

output "private_key" {
  value       = module.osmosis-rpc.private_key
  sensitive   = true
  description = "Private key to connect to the droplet"
}

output "ssh_help" {
  value       = module.osmosis-rpc.ssh_help
  description = "SSH command to access droplet"
}