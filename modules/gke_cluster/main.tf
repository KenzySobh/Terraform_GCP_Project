resource "google_container_cluster" "this" {
  name     = var.name
  location = var.location

  initial_node_count = var.node_count

  node_config {
    machine_type = var.machine_type
  }
}
