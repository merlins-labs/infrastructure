resource "digitalocean_droplet" "rpc" {

  count = var.nodes

  name   = format("%s-fullnode-%d", var.name, count.index)
  region = var.region
  image  = "osmosislabs-osmosis"
  size   = var.size
  tags   = concat(var.tags, ["terraform"])

  monitoring = true

  # Volumes
  volume_ids = []

  # SSH Access
  ssh_keys = [
    digitalocean_ssh_key.this.fingerprint
  ]

  droplet_agent = false

  # Initialize node via cloud init
  user_data = var.initialize_nodes ? data.template_file.cloud_init_rpc[count.index].rendered : ""

  lifecycle {
    ignore_changes = [user_data]
  }
}

data "template_file" "cloud_init_rpc" {

  count    = var.nodes
  template = file("${path.module}/templates/cloud_init_rpc.yaml")

  vars = {
    moniker = format("%s-%d", var.name, count.index)
  }
}
