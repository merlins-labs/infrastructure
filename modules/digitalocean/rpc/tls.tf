locals {
  create_tls_key = var.tls_public_key == "" || var.tls_private_key == ""
}

resource "tls_private_key" "this" {
  count       = local.create_tls_key ? 1 : 0
  algorithm   = "ECDSA"
  ecdsa_curve = "P384"
}

resource "digitalocean_ssh_key" "this" {
  name       = "${var.name}-key"
  public_key = local.create_tls_key ? tls_private_key.this.0.public_key_openssh : file(var.tls_public_key)
}