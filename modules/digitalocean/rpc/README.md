<!-- BEGIN_TF_DOCS -->

# Terraform Digitalocean Osmosis RPC

This Terraform module creates an opinionated rpc setup on Digitalocean for osmosis.

## Usage Examples

Some examples can be found in this repository:

- [Single RPC](../../../digitalocean/single-rpc/)
- [Single RPC with Floating IP](../../../digitalocean/single-rpc-with-floating-ip)
- [Single RPC with Monitor Alert](../../../digitalocean/single-rpc-with-monitor-alerts)
- [Loadbalanced RPC](../../../digitalocean/loadbalanced-rpc)
- [Loadbalanced RPC with Monitor Alert](../../../digitalocean/loadbalanced-rpc-with-monitor-alerts)

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0.0 |
| cloudflare | ~> 3.0 |
| digitalocean | ~> 2.17 |
| tls | ~> 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| digitalocean | ~> 2.17 |
| template | n/a |
| tls | ~> 3.1.0 |

## Inputs

| Name | Description | Default | Required |
|------|-------------|---------|:--------:|
| create\_loadbalancer | Flag to create a Load Balancer before the nodes. Ignored if nodes = 1 | `true` | no |
| expose\_lcd\_endpoint | Expose publicly the lcd/rest endpoint. Exposed by default via Load Balancer if present | `"true"` | no |
| expose\_rpc\_endpoint | Expose publicly the rpc endpoint. Exposed by default via Load Balancer if present | `"true"` | no |
| initialize\_nodes | If true it would automatically run osmosis installer to initialize the nodes | `true` | no |
| loadbalancer\_algorithm | The load balancing algorithm used to determine which backend Droplet will be selected by a client. It must be either round\_robin or least\_connections. | `"round_robin"` | no |
| loadbalancer\_size | The size of the Load Balancer. More info: https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/loadbalancer#size | `"lb-small"` | no |
| name | Node name | `"osmosis-rpc"` | no |
| nodes | Number of rpc nodes create | `3` | no |
| region | Digitalocean Region | `"sfo3"` | no |
| size | Droplet sizing. Find slugs with: `doctl compute size list` | `"m3-4vcpu-32gb"` | no |
| tags | A list of the tags to be applied to the node. | ```[ "rpc", "mainnet" ]``` | no |
| tls\_private\_key | Path to private tls key - automatically generated if empty | `""` | no |
| tls\_public\_key | Path to public tls key - automatically generated if empty | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| droplets\_ids | The IDs of the Droplets |
| droplets\_ips | The ips of the Droplets |
| droplets\_urn | The uniform resource name for the Droplets |
| loadbalancer\_id | The ip of the Load Balancer |
| loadbalancer\_ip | The ID of the Load Balancer |
| loadbalancer\_urn | The uniform resource name for the Load Balancer |
| private\_key | Private key to connect to the droplets |
| ssh\_help | Instructions to connect to a RPC node |

## Usage

### Single RPC Setup

```hcl
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
```

### Loadbalanced RPC Setup

```hcl
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

  name   = "osmosis-loadbalanced-rpc"
  nodes  = 3
  region = "nyc3"
  tags   = ["osmosis", "fullnode"]

  # This is the recommended size for mainnet
  # Find others slugs with: `doctl compute size list`"
  size = "m3-4vcpu-32gb"
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
```
<!-- END_TF_DOCS -->