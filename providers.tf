terraform {
  required_providers {
    vault = {
      source = "hashicorp/vault"
      version = "4.6.0"
    }
    opnsense = {
      source  = "browningluke/opnsense"
      version = "0.11.0"
    }
  }
 cloud {

    organization = "guyzsarun-terraform-cloud"

    workspaces {
      name = "opnsense-configuration"
    }
  }
}

data "vault_kv_secret_v2" "opnsense_credentials" {
  mount = var.vault.mount
  name = "${var.vault.name}"
}
provider "opnsense" {
  uri        = data.vault_kv_secret_v2.opnsense_credentials.data["uri"]
  api_key    = data.vault_kv_secret_v2.opnsense_credentials.data["api_key"]
  api_secret = data.vault_kv_secret_v2.opnsense_credentials.data["api_secret"]
}