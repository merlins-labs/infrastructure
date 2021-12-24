variable "osmosis_version" {
  description = "Osmosis versions to use"
  default     = "6.0.0"
  type        = string
}

variable "osmosis_chain_id" {
  description = "Osmosis chain id to setup"
  default     = "osmosis-clean-testnet-X"
  type        = string
}

variable "region" {
  description = "Digital Ocean Region"
  default     = "nyc3"
  type        = string
}

variable "node_image" {
  description = "Droplet image name"
  default     = "ubuntu-20-04-x64"
  type        = string
}

variable "node_size" {
  description = "Droplet sizing for the osmosis node(s)"
  default     = "m6-1vcpu-2gb"
  type        = string
}

variable "node_count" {
  description = "How many Osmosis nodes to deploy"
  default     = 1
  type        = number
}

variable "node_prefix" {
  description = "Node name prefix"
  default     = "osmosis"
  type        = string
}

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
