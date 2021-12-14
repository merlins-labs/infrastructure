terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

variable "do_token" {}
variable "pvt_key" {}

provider "digitalocean" {
  token = var.do_token
}
# This is added at https://cloud.digitalocean.com/account/security
data "digitalocean_ssh_key" "terraform" {
  name = "Macbook Pro Dan"
}
