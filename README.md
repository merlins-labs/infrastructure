# Osmosis IAC WIP

This is an experimental attempt to setup the infrastructure as code for running different osmosis setups via Terraform's IAC (Infrastructure as code). Terraform is quite flexible, I'm sure this can be improved a lot. The idea is to be able to recycle nodes fast and to make sure that we are always using the exact same configuration. 
At first we will use DigitalOcean but we could make modules for different cloud providers and different types of configurations. 

This setup works with Terraform's CLI and is executed locally. We will eventually move to Terraform Cloud. 

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

### DigitalOcean API Token
Get an API token from [here](https://cloud.digitalocean.com/account/api)
```
export DO_PAT="your_personal_access_token"
```

### Setup or use an existing SSH keys to access the droplets.
Go to your [Security](https://cloud.digitalocean.com/account/security) settings and add a new private ssh key that will be used to manage your resources.
Give it the name "terraform".


# Executing Terraform

### Plan any changes that are required for your infrastructure
`terraform plan` is the command used to see what changes you are making. 

```bash
terraform plan \
  -var "do_token=${DO_PAT}" \
  -var "pvt_key=$HOME/.ssh/id_rsa"

```

### Execute the current plan 
`terraform apply` is used to confirm the changes. 

```bash
terraform plan \
  -var "do_token=${DO_PAT}" \
  -var "pvt_key=$HOME/.ssh/id_rsa"

```

### Files

- Provider.tf
  - Defines the provider and provider's configuration
- osmosis-node.tf
  - Defines a node that will be created in DigitalOcean
- setup.sh (WIP, does not do anything yet)
  - Utility to help you run Terraform with different parameters
- scripts/start-node.sh
  - Bash script to setup a testnet node
- scripts/setup-genesis-state.sh
  - Example Bash script to a genesis state
  
  
 WIP, more scripts will be added and they will be broken down by type of testnets, upgrades ,etc. 
