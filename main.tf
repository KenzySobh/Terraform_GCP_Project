terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = "terraform-test-project-473708 "
  region = "us-central1"
  credentials = "newKeys.json"
}

module "project" {
  source          = "./modules/project"
  project_id      = var.project_id
  billing_account = var.billing_account
  org_id          = var.organization_id
  apis            = var.apis
  labels          = var.labels
}
