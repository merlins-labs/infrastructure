<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement\_digitalocean) | 2.16 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | 2.16.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 3.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [digitalocean_droplet.osmosis_node](https://registry.terraform.io/providers/digitalocean/digitalocean/2.16/docs/resources/droplet) | resource |
| [digitalocean_ssh_key.osmosis_node](https://registry.terraform.io/providers/digitalocean/digitalocean/2.16/docs/resources/ssh_key) | resource |
| [tls_private_key.osmosis_tls_key](https://registry.terraform.io/providers/hashicorp/tls/3.1.0/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | How many Osmosis nodes to deploy | `number` | `1` | no |
| <a name="input_node_image"></a> [node\_image](#input\_node\_image) | Droplet image name | `string` | `"ubuntu-20-04-x64"` | no |
| <a name="input_node_prefix"></a> [node\_prefix](#input\_node\_prefix) | Node name prefix | `string` | `"osmosis"` | no |
| <a name="input_node_size"></a> [node\_size](#input\_node\_size) | Droplet sizing for the osmosis node(s) | `string` | `"m6-1vcpu-2gb"` | no |
| <a name="input_region"></a> [region](#input\_region) | Digital Ocean Region | `string` | `"nyc3"` | no |
| <a name="input_tls_private_key"></a> [tls\_private\_key](#input\_tls\_private\_key) | Path to private tls key - automatically generated if empty | `string` | `""` | no |
| <a name="input_tls_public_key"></a> [tls\_public\_key](#input\_tls\_public\_key) | Path to public tls key - automatically generated if empty | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nodes_info"></a> [nodes\_info](#output\_nodes\_info) | n/a |
| <a name="output_nodes_ips"></a> [nodes\_ips](#output\_nodes\_ips) | n/a |
| <a name="output_nodes_names"></a> [nodes\_names](#output\_nodes\_names) | n/a |
| <a name="output_tls_private_key"></a> [tls\_private\_key](#output\_tls\_private\_key) | n/a |
<!-- END_TF_DOCS -->