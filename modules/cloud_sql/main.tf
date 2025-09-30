resource "google_sql_database_instance" "this" {
  name             = var.name
  database_version = var.version
  region           = var.region

  settings {
    tier = var.tier
  }
}
