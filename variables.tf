variable "project_id" {}
variable "organization_id" {}
variable "billing_account" {}
variable "region" { default = "us-central1" }
variable "labels" { type = map(string) }
variable "apis" { type = list(string) }
