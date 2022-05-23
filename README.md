# Osmosis Infrastructure

This repository contains reference architectures for common osmosis (and cosmos chains) infrastructure setups.
The reference architecture is specified ad Infrastructure As Code (IAC) using [Terraform](https://www.terraform.io/) and get be used a starting point to deploy blockchain nodes.

> Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently. To learn about more about Terraform please check the [documentation](https://www.terraform.io/docs)

Currently we support the following setups:

- [DigitalOcean - Single RPC Node]()
- [DigitalOcean - Loadbalanced RPC Node]()

More setups and support for more cloud providers will be added in the future. 
If there is a setup that you would like implemented, feel free to request opening an issue.

## Repository Structure

|   Folder    |                      Description                      |
| ----------- | ----------------------------------------------------- |
| `modules/`  | Contains the terraform modules divided by providers   |
| `examples/` | Contains examples of modules usage                    |

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

## Reference Architecture

Currently this repository contains the following modules:

|      Name      | Provider |      Description      |                     Usage                     |
| -------------- | -------- | --------------------- | -------------------------------------------- |
| `Osmosis Node` | DO       | Setup osmosis node(s) | [link](./modules/digital-ocean/osmosis-node) |

Examples on how to use the modules can be found in the [examples](./examples/) folder.

### DigitalOcean

