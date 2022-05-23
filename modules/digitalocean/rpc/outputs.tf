output "droplets_ips" {
  value       = digitalocean_droplet.rpc.*.ipv4_address
  description = "The ips of the Droplets"
}

output "droplets_ids" {
  value       = digitalocean_droplet.rpc.*.id
  description = "The IDs of the Droplets"
}

output "droplets_urn" {
  value       = digitalocean_droplet.rpc.*.urn
  description = "The uniform resource name for the Droplets"
}

output "loadbalancer_ip" {
  value       = local.create_loadbalancer ? digitalocean_loadbalancer.this.0.ip : null
  description = "The ID of the Load Balancer"
}

output "loadbalancer_id" {
  value       = local.create_loadbalancer ? digitalocean_loadbalancer.this.0.ip : null
  description = "The ip of the Load Balancer"
}

output "loadbalancer_urn" {
  value       = local.create_loadbalancer ? digitalocean_loadbalancer.this.0.urn : null
  description = "The uniform resource name for the Load Balancer"
}

output "private_key" {
  value       = local.create_tls_key ? tls_private_key.this.0.private_key_pem : file(var.tls_private_key)
  sensitive   = true
  description = "Private key to connect to the droplets"
}

output "ssh_help" {
  value       = <<EOT

Get ssh key:
terraform output --raw private_key > droplet.key && chmod 600 droplet.key

Connect to the instancs:

${join("\n", formatlist("ssh root@%s -i droplet.key", digitalocean_droplet.rpc.*.ipv4_address))}

EOT
  description = "Instructions to connect to a RPC node"
}
