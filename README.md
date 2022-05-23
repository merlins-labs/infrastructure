![Banner](https://raw.githubusercontent.com/osmosis-labs/osmosis/main/assets/banner.png)

# Osmosis Infrastructure

This repository contains reference architectures for common osmosis infrastructure setups.

The reference architecture is specified ad Infrastructure As Code (IAC) using [Terraform](https://www.terraform.io/) and get be used a starting point to deploy blockchain nodes.

> Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently. To learn about more about Terraform please check the [documentation](https://www.terraform.io/docs)

Currently we support the following setups:

| Provider       | Setup                          | Description                                                            | Usage                                                       |
| -------------- | ------------------------------ | ---------------------------------------------------------------------- | ----------------------------------------------------------- |
| `DigitalOcean` | single-rpc                     | Single rpc endpoint                                                    | [link](./digitalocean/single-rpc)                           |
| `DigitalOcean` | single-rpc-with-floating-ip    | Single rpc endpoint with fixed ip                                      | [link](./digitalocean/single-rpc=floating-ip)               |
| `DigitalOcean` | single-rpc-with-monitor-alerts | Single rpc endpoint with resource usage alerts                         | [link](./digitalocean/single-rpc-with-monitor-alerts)       |
| `DigitalOcean` | loadbalanced-rpc               | Multiple rpc endpoint behind a loadbalancer                            | [link](./digitalocean/loadbalanced-rpc)                     |
| `DigitalOcean` | loadbalanced-rpc               | Multiple rpc endpoint behind a loadbalancer with resource usage alerts | [link](./digitalocean/loadbalanced-rpc-with-monitor-alerts) |

More setups and more cloud providers support will be added in the future. 
If there is a setup that you would like implemented, feel free to request it opening an issue.

## Repository Structure

| Folder          | Description                                         |
| --------------- | --------------------------------------------------- |
| `modules/`      | Contains the terraform modules divided by providers |
| `digitalocean/` | Contains example of infra setup in digitalocean     |

## Prerequisites

### Install Terraform

Install Terraform via the commands below:

In OSX/Linux with Brew:

```bash
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

In Windows via [Chocolatey](https://chocolatey.org/):

```bash
choco install terraform
```

Get more options from the [official docs](https://learn.hashicorp.com/tutorials/terraform/install-cli).


