variable "network" {}
variable "subnets" {
  type = map(object({
    cidr   = string
    region = string
  }))
}
