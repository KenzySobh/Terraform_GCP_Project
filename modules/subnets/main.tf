resource "google_compute_subnetwork" "this" {
  for_each       = var.subnets
  name           = each.key
  ip_cidr_range  = each.value.cidr
  region         = each.value.region
  network        = var.network
}
