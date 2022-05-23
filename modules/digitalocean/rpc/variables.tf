# RPC Nodes options

variable "name" {
  description = "Node name"
  default     = "osmosis-rpc"
  type        = string
}

variable "region" {
  description = "Digitalocean Region"
  default     = "sfo3"
  type        = string
}

variable "nodes" {
  description = "Number of rpc nodes create"
  default     = 3
  type        = number
}

variable "tags" {
  description = "A list of the tags to be applied to the node."
  default     = ["rpc", "mainnet"]
  type        = list(string)
}

variable "size" {
  description = "Droplet sizing. Find slugs with: `doctl compute size list`"
  default     = "m3-4vcpu-32gb"
  type        = string
}

variable "initialize_nodes" {
  description = "If true it would automatically run osmosis installer to initialize the nodes"
  default     = true
  type        = bool
}

# Firewall

variable "expose_rpc_endpoint" {
  description = "Expose publicly the rpc endpoint. Exposed by default via Load Balancer if present"
  default     = "true"
  type        = string
}

variable "expose_lcd_endpoint" {
  description = "Expose publicly the lcd/rest endpoint. Exposed by default via Load Balancer if present"
  default     = "true"
  type        = string
}

# SSH Access

variable "tls_public_key" {
  description = "Path to public tls key - automatically generated if empty"
  default     = ""
  type        = string
}

variable "tls_private_key" {
  description = "Path to private tls key - automatically generated if empty"
  default     = ""
  type        = string
}

# Loadbalancer options

variable "create_loadbalancer" {
  description = "Flag to create a Load Balancer before the nodes. Ignored if nodes = 1"
  default     = true
  type        = bool
}

variable "loadbalancer_size" {
  description = "The size of the Load Balancer. More info: https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/loadbalancer#size"
  default     = "lb-small"
  type        = string
}

variable "loadbalancer_algorithm" {
  description = "The load balancing algorithm used to determine which backend Droplet will be selected by a client. It must be either round_robin or least_connections."
  default     = "round_robin"
  type        = string
}

