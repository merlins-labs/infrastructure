locals {
  username = "osmosis"
}

data "template_file" "osmosis_node" {
  template = file("${path.module}/templates/osmosis_node.yaml")

  vars = {
    ssh_authorized_key   = local.create_tls_key ? tls_private_key.osmosis_tls_key.0.public_key_openssh : file(var.tls_public_key)
    username             = local.username
    osmosis_chain_id     = var.osmosis_chain_id
    osmosis_version      = var.osmosis_version
    #osmosis_genesis_file = var.osmosis_genesis_file == "" ? "" : file(var.var.osmosis_genesis_file)
  }
}

resource "digitalocean_droplet" "osmosis_node" {
  count  = var.node_count
  region = var.region
  name   = "${var.node_prefix}-node-${count.index}"
  image  = var.node_image
  size   = var.node_size
  ssh_keys = [
    digitalocean_ssh_key.osmosis_node.fingerprint
  ]

  # Initialize node via cloud init
  user_data = data.template_file.osmosis_node.rendered
}