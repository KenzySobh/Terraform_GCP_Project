resource "google_project" "this" {
  project_id      = var.project_id
  name            = var.project_id
  org_id          = var.org_id
  billing_account = var.billing_account
  labels          = var.labels
}

resource "google_project_service" "enabled_apis" {
  for_each   = toset(var.apis)
  project    = google_project.this.project_id
  service    = each.key
  disable_on_destroy = false
}
