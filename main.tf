terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = "stunning-ruler-473613-b9"
  region = "us-central1"
  credentials = "keys.json"
}

module "project" {
  source          = "./modules/project"
  project_id      = var.project_id
  billing_account = var.billing_account
  org_id          = var.organization_id
  apis            = var.apis
  labels          = var.labels
}
