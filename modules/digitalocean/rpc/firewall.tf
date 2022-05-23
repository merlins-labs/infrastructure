resource "digitalocean_firewall" "in_ssh" {
  name        = "${var.name}-allow-in-ssh"
  droplet_ids = digitalocean_droplet.rpc.*.id

  # To increase security avoid "0.0.0.0/0" 
  # and limit ssh access to secure source addresses 
  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
}

resource "digitalocean_firewall" "in_p2p" {
  name        = "${var.name}-allow-in-p2p"
  droplet_ids = digitalocean_droplet.rpc.*.id

  inbound_rule {
    protocol         = "tcp"
    port_range       = "26656"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
}

resource "digitalocean_firewall" "out_all" {
  name        = "${var.name}-allow-out-all"
  droplet_ids = digitalocean_droplet.rpc.*.id

  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}

# Expose rpc endpoint
resource "digitalocean_firewall" "in_lcd" {
  name        = "${var.name}-allow-in-rpc"
  droplet_ids = digitalocean_droplet.rpc.*.id
  count       = var.expose_rpc_endpoint ? 1 : 0

  inbound_rule {
    protocol         = "tcp"
    port_range       = "26657" # tendermint rpc
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
}

# Expose lcd endpoint
resource "digitalocean_firewall" "in_rpc" {
  name        = "${var.name}-allow-in-lcd"
  droplet_ids = digitalocean_droplet.rpc.*.id
  count       = var.expose_lcd_endpoint ? 1 : 0

  inbound_rule {
    protocol         = "tcp"
    port_range       = "1317" # tendermint lcd/rest
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
}

# Expose rest and lcd ports publicly if no loadbalancer is present
resource "digitalocean_firewall" "in_rpc_lcd_from_lb" {
  name        = "${var.name}-allow-in-rpc-lcd-from-lb"
  droplet_ids = digitalocean_droplet.rpc.*.id
  count       = local.create_loadbalancer ? 1 : 0

  inbound_rule {
    protocol                  = "tcp"
    port_range                = "26657" # tendermint rpc
    source_load_balancer_uids = [digitalocean_loadbalancer.this.0.id]
  }

  inbound_rule {
    protocol                  = "tcp"
    port_range                = "1317" # rest/lcd
    source_load_balancer_uids = [digitalocean_loadbalancer.this.0.id]
  }
}
