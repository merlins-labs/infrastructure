resource "digitalocean_droplet" "rpc" {

  count = var.nodes

  name   = format("%s-fullnode-%d", var.name, count.index)
  region = var.region
  image  = var.image
  size   = var.size
  tags   = concat(var.tags, ["rpc", "terraform"])

  monitoring = true

  # Volumes
  volume_ids = []

  # SSH Access
  ssh_keys = [
    digitalocean_ssh_key.this.fingerprint
  ]

  droplet_agent = false

  # Initialize node via cloud init
  user_data = data.template_file.cloud_init_rpc[count.index].rendered

  lifecycle {
    ignore_changes = [user_data]
  }
}

data "template_file" "cloud_init_rpc" {

  count    = var.nodes
  template = file("${path.module}/templates/cloud_init_rpc.yaml")

  vars = {
    moniker = format("%s-fullnode-%d", var.name, count.index)

    healthcheck_rpc_node            = "http://127.0.0.1:26657"
    healthcheck_check_interval      = 10
    healthcheck_new_block_threshold = 30
  }
}
