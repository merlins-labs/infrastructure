#Type of node to create
resource "digitalocean_droplet" "osmo-node" {
  image = "ubuntu-20-04-x64"
  name = var.instance_name
  region = var.instance_region
  size = var.instance_type
  ssh_keys = [
    data.digitalocean_ssh_key.terraform.id
  ]

#Connect to node
  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file(var.pvt_key)
    timeout = "2m"
  }

#Single validator Osmosis testnet script
   provisioner "file" {
      source      = "scripts/single-validator-testnet.sh"
      destination = "/tmp/single-validator-testnet.sh"
    }

#Setup Genesis State script
   provisioner "file" {
      source      = "scripts/setup-genesis-state.sh"
      destination = "/tmp/setup-genesis-state.sh"
    }

#Execute bash scripts
    provisioner "remote-exec" {
      inline = [
        "chmod +x /tmp/single-validator-testnet.sh",
        "/tmp/single-validator-testnet.sh",
      ]
    }

   provisioner "remote-exec" {
      inline = [
        "chmod +x /tmp/setup-genesis-state.sh",
        "/tmp/setup-genesis-state.sh",
      ]
    }
}


