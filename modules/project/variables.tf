variable "project_id" {}
variable "org_id" {}
variable "billing_account" {}
variable "labels" { type = map(string) }
variable "apis" { type = list(string) }
