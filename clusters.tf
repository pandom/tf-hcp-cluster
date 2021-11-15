// Create an HVN
resource "hcp_hvn" "vault_hvn" {
  hvn_id         = "hcp-tf-vault-hvn"
  cloud_provider = "aws"
  region         = var.region
  cidr_block     = "172.25.16.0/20"
}

// Create a peering connection between two HVNs
resource "hcp_hvn" "consul_hvn" {
  hvn_id         = "hcp-tf-consul-hvn"
  cloud_provider = "aws"
  region         = var.region
  cidr_block     = "172.18.16.0/20"
}

resource "hcp_hvn_peering_connection" "peer" {
  hvn_1 = hcp_hvn.vault_hvn.self_link
  hvn_2 = hcp_hvn.consul_hvn.self_link
}


resource "hcp_consul_cluster" "consul" {
  hvn_id     = hcp_hvn.vault_hvn.hvn_id
  cluster_id = "hcp-tf-consul-cluster"
  tier       = "plus"
}

// Create a Vault cluster in the same region and cloud provider as the HVN
resource "hcp_vault_cluster" "vault" {
  cluster_id = "hcp-tf-vault-cluster"
  hvn_id     = hcp_hvn.vault_hvn.hvn_id
  tier = "standard_small"
}