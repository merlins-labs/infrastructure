output "ip" {
  value       = digitalocean_floating_ip.this.ip_address
  description = "Droplet IP"
}

output "private_key" {
  value       = module.osmosis-rpc.private_key
  sensitive   = true
  description = "Private key to connect to the droplet"
}

output "ssh_help" {
  value       = <<EOT
Get ssh key:
terraform output --raw private_key > droplet.key && chmod 600 droplet.key

Connect to the instance:
ssh root@${digitalocean_floating_ip.this.ip_address} -i droplet.key 
EOT
  description = "SSH command to access droplet"
}
