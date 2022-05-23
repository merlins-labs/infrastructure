# Load Balanced RPC setup

This examples creates a single droplet in Digitalocean that:

- runs the latest osmosisd binary
- authomatically syncs the state from a pruned snapshot

## Usage

### Create DigitalOcean API Token

1. Get an API token from [here](https://cloud.digitalocean.com/account/api)

2. Export the token to an environment variable. Do not share this token as it gives access to your console.

```
export DIGITALOCEAN_TOKEN="your_personal_access_token"
```

### Create infrastructure

1. Initialize terraform:

```bash
make init
```

2. Create a plan:

```bash
make plan
```

3. Inspect the plan and then deploy the infrastructure:

```bash
make apply
```

4. Get ssh instructions:

```bash
terraform output --raw  ssh_help 
```

Expected output:

```bash
Get ssh key:
terraform output --raw private_key > droplet.key && chmod 600 droplet.key

Connect to the instancs:

ssh root@<IP> -i droplet.key
```

5. Follow the instructions to ssh into the droplet:

```bash
terraform output --raw private_key > droplet.key && chmod 600 droplet.key

ssh root@<IP> -i droplet.key # <IP> will be the actual ip of the droplet
```

> The nodes are configured to accept traffic to port `22` from anywhere which is not
> generally recommended for production setup.
>
> Please setup firewall rules according to your needs.

6. Wait for the node to be initialized. The droplets is initialized via the [osmosis-installer](https://github.com/osmosis-labs/osmosis-installer) which installs the necessary packages and statesync the node. You can follow the process with:

```bash
tail -f /var/log/cloud-init-output.log
```

7. Play around with your osmosis node!
