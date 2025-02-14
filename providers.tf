terraform {
  required_providers {
    opnsense = {
      source  = "browningluke/opnsense"
      version = "0.11.0"
    }
  }
}

provider "opnsense" {
  uri        = var.opnsense.uri
  api_key    = var.opnsense.api_key
  api_secret = var.opnsense.api_secret
}
