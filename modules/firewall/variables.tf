variable "name" {}
variable "network" {}
variable "ports" { type = list(string) }
variable "source_ranges" { type = list(string) }
