locals {
  nodes_ips       = digitalocean_droplet.osmosis_node.*.ipv4_address
  nodes_names     = digitalocean_droplet.osmosis_node.*.name
  created_tls_key = var.tls_public_key == "" || var.tls_private_key == ""
}

output "nodes_names" {
  value = local.nodes_names
}

output "nodes_ips" {
  value = local.nodes_ips
}

output "nodes_info" {
  value = zipmap(local.nodes_names, local.nodes_ips)
}

output "tls_private_key" {
  value = local.created_tls_key ? tls_private_key.osmosis_tls_key.0.private_key_pem : file(var.tls_private_key)
}