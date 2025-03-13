data "local_file" "dns_override" {
  filename = "${path.module}/dns_override.json"
}
locals {
  dns_override = jsondecode(data.local_file.dns_override.content)
  hosts = flatten([
    for srv in local.dns_override : [
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

output "dns_override" {
  value = {
    for dns in local.hosts : "${dns.hostname}.${dns.domain}" => dns.server
  }
}