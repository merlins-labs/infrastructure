locals {
  create_loadbalancer = var.create_loadbalancer && var.nodes > 1
}

resource "digitalocean_loadbalancer" "this" {

  name   = "${var.name}-lb"
  region = var.region
  count  = local.create_loadbalancer ? 1 : 0

  size      = var.loadbalancer_size
  algorithm = var.loadbalancer_algorithm

  forwarding_rule {
    entry_protocol  = "http"
    entry_port      = 80
    target_protocol = "http"
    target_port     = 26657
  }

  forwarding_rule {
    entry_protocol  = "http"
    entry_port      = 8080
    target_protocol = "http"
    target_port     = 8080
  }

  forwarding_rule {
    entry_protocol  = "http"
    entry_port      = 1317
    target_protocol = "http"
    target_port     = 1317
  }

  healthcheck {
    port     = "26657"
    protocol = "tcp"
  }

  sticky_sessions {
    type               = "cookies"
    cookie_name        = "osmosis"
    cookie_ttl_seconds = 300
  }

  droplet_ids = digitalocean_droplet.rpc.*.id
}
