variable "opnsense" {
  type = object({
    uri        = string
    api_key    = string
    api_secret = string
  })
  sensitive = true
}

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