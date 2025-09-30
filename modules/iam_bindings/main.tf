resource "google_project_iam_binding" "this" {
  project = var.project_id
  role    = var.role
  members = var.members
}
