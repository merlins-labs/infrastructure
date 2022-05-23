# Monitor alerts can be configured to alert about,
# e.g., disk or memory usage exceeding a certain threshold or traffic at a certain limit. 
# Notifications can be sent to either an email address or a Slack channel.

# Learn more: https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/monitor_alert

resource "digitalocean_monitor_alert" "cpu_high_alert" {
  alerts {
    slack {
      channel = var.slack_channel
      url     = var.slack_webhook
    }
  }
  window      = "5m"
  type        = "v1/insights/droplet/cpu"
  compare     = "GreaterThan"
  value       = 85
  enabled     = true
  entities    = module.osmosis-rpc.droplets_ids
  description = "High CPU usage"
}

resource "digitalocean_monitor_alert" "cpu_low_alert" {
  alerts {
    slack {
      channel = var.slack_channel
      url     = var.slack_webhook
    }
  }
  window      = "10m"
  type        = "v1/insights/droplet/cpu"
  compare     = "LessThan"
  value       = 5
  enabled     = true
  entities    = module.osmosis-rpc.droplets_ids
  description = "Low CPU usage. Node could be down."
}

resource "digitalocean_monitor_alert" "ram_high_alert" {
  alerts {
    slack {
      channel = var.slack_channel
      url     = var.slack_webhook
    }
  }
  window      = "5m"
  type        = "v1/insights/droplet/memory_utilization_percent"
  compare     = "GreaterThan"
  value       = 85
  enabled     = true
  entities    = module.osmosis-rpc.droplets_ids
  description = "High Memory usage"
}

resource "digitalocean_monitor_alert" "disk_high_alert" {
  alerts {
    slack {
      channel = var.slack_channel
      url     = var.slack_webhook
    }
  }
  window      = "5m"
  type        = "v1/insights/droplet/disk_utilization_percent"
  compare     = "GreaterThan"
  value       = 75
  enabled     = true
  entities    = module.osmosis-rpc.droplets_ids
  description = "Disk at 75% capacity"
}

resource "digitalocean_monitor_alert" "disk_almost_full_alert" {
  alerts {
    slack {
      channel = var.slack_channel
      url     = var.slack_webhook
    }
  }
  window      = "5m"
  type        = "v1/insights/droplet/disk_utilization_percent"
  compare     = "GreaterThan"
  value       = 90
  enabled     = true
  entities    = module.osmosis-rpc.droplets_ids
  description = "Disk at 90% capacity"
}