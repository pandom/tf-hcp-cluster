resource "hcp_boundary_cluster" "boundary" {
  cluster_id = "burkey-boundary"
  username   = "burkey"
  password   = var.boundary_bootstrap_password
}