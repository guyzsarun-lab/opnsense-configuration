variable "vault" {
  sensitive = true
  type = object({
    mount = string
    name  = string
  })
}