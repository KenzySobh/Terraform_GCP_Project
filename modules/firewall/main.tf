resource "google_compute_firewall" "this" {
  name    = var.name
  network = var.network
  allow {
    protocol = "tcp"
    ports    = var.ports
  }
  source_ranges = var.source_ranges
}
