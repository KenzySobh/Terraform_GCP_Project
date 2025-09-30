output "subnets" {
  value = { for k, v in google_compute_subnetwork.this : k => v.self_link }
}
