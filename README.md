# Osmosis IAC WIP

This is an experimental attempt to setup the infrastructure as code for running different osmosis setups via Terraform's IAC (Infrastructure as code). 

Terraform is quite flexible, I'm sure this can be improved a lot. The idea is to be able to recycle nodes fast and to make sure that we are always using the exact same configuration.

At first we will use DigitalOcean but we could make modules for different cloud providers and different types of configurations. 

This setup works with Terraform's CLI and is executed locally. We will eventually move to Terraform Cloud. 

## Repository structure

|   Folder    |                      Description                      |
| ----------- | ----------------------------------------------------- |
| `modules/`  | Contains the terraform modules divided by providers   |
| `examples/` | Contains examples of modules usage                    |
| `scripts/`  | Contains scripts to perform basic operations on nodes |

## Prerequisites

### Install Terraform

Install Terraform via the commands below or get more options from the [official docs](https://learn.hashicorp.com/tutorials/terraform/install-cli).

OSX
```
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```
Windows via [Chocolatey](https://chocolatey.org/)
``` 
choco install terraform
```

### Create DigitalOcean API Token

Get an API token from [here](https://cloud.digitalocean.com/account/api)

```
export DIGITALOCEAN_TOKEN="your_personal_access_token"
```

## Terraform Modules

Currently this repository contains the following modules:

|      Name      | Provider |      Description      |                     Usage                     |
| -------------- | -------- | --------------------- | -------------------------------------------- |
| `Osmosis Node` | DO       | Setup osmosis node(s) | [link](./modules/digital-ocean/osmosis-node) |

Examples on how to use the modules can be found in the [examples](./examples/) folder.