module "do-osmosis-node" {
  source = "../../modules/digital-ocean/osmosis-node"

  osmosis_chain_id = "osmosis-clean-testnet-X"
  osmosis_version  = "6.0.0"

  region     = "nyc3"
  node_count = 1
  node_image = "ubuntu-20-04-x64"
  node_size  = "s-1vcpu-2gb"
}

output "osmosis_nodes_info" {
  value = module.do-osmosis-node.nodes_info
}

output "osmosis_nodes_private_key" {
  value     = module.do-osmosis-node.tls_private_key
  sensitive = true
}