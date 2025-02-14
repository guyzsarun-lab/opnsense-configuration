locals {
  hosts = flatten([
    for srv in var.dns_override : [
      for h in srv.hostname : {
        hostname = h
        domain   = srv.domain
        server   = srv.server
      }
    ]
  ])
}

resource "opnsense_unbound_host_override" "dns_override" {
  enabled     = true
  description = "${each.value.hostname}.${each.value.domain} managed by Terraform"

  hostname = each.value.hostname
  domain   = each.value.domain
  server   = each.value.server
  for_each = { for dns in local.hosts : dns.hostname => dns }
}