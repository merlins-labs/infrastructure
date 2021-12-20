variable "do_token" {
  description = "Digital Ocean API Token"
  default     = ""
}

variable "pvt_key" {
  description = "Private Key to use witH DigitalOcean"
  default     = "~/.ssh/terraform"
}


variable "instance_type" {
  description = "Type of DigitalOcean instance to provision"
  default     = "m6-4vcpu-32gb"
}

variable "instance_region" {
  description = "Region"
  default     = "nyc3"
}

variable "instance_name" {
  description = "DO instance name"
  default     = "osmo-node"
}

