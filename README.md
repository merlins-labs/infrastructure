![Banner](https://raw.githubusercontent.com/osmosis-labs/osmosis/main/assets/banner.png)

# Osmosis Infrastructure

This repository contains reference architectures for common osmosis infrastructure setups.

The reference architecture is specified ad Infrastructure As Code (IAC) using [Terraform](https://www.terraform.io/) and can be used as a starting point to deploy blockchain nodes.

> Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently. To learn more about Terraform please check the [documentation](https://www.terraform.io/docs)

Currently, the following setups are present:

| Provider       | Setup                          | Description                                                            | Usage                                                       |
| -------------- | ------------------------------ | ---------------------------------------------------------------------- | ----------------------------------------------------------- |
| `digitalocean` | single-rpc                     | Single rpc endpoint                                                    | [link](./digitalocean/single-rpc)                           |
| `digitalocean` | single-rpc-with-floating-ip    | Single rpc endpoint with fixed ip                                      | [link](./digitalocean/single-rpc=floating-ip)               |
| `digitalocean` | single-rpc-with-monitor-alerts | Single rpc endpoint with resource usage alerts                         | [link](./digitalocean/single-rpc-with-monitor-alerts)       |
| `digitalocean` | loadbalanced-rpc               | Multiple rpc endpoint behind a loadbalancer                            | [link](./digitalocean/loadbalanced-rpc)                     |
| `digitalocean` | loadbalanced-rpc               | Multiple rpc endpoint behind a loadbalancer with resource usage alerts | [link](./digitalocean/loadbalanced-rpc-with-monitor-alerts) |

More setups and more cloud providers support will be added in the future. 
If there is a setup that you would like implemented, feel free to request it opening an issue.

## Repository Structure

| Folder          | Description                                         |
| --------------- | --------------------------------------------------- |
| `modules/`      | Contains the terraform modules divided by providers |
| `digitalocean/` | Contains an example of infra setup in digitalocean     |

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


