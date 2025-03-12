variable "dns_override" {
  type = list(object({
    hostname = list(string)
    domain   = string
    server   = string
  }))
  default = [{
    hostname = ["www", "maps"]
    domain   = "example.com"
    server   = ""
  }]
}
variable "vault" {
  sensitive = true
  type = object({
    mount = string
    name = string
  })
}