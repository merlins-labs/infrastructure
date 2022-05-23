# To send alerts we use slack webhook
# Configure a slack webhook following the instructions here: https://api.slack.com/messaging/webhooks

variable "slack_webhook" {
  type        = string
  description = "Slack webhook used to send monitoring alerts"
}

variable "slack_channel" {
  type        = string
  description = "Channel were to send monitoring alerts"
}