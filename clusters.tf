// Create an HVN for Vault
resource "hcp_hvn" "vault_hvn" {
  hvn_id         = "hcp-tf-vault-hvn"
  cloud_provider = "aws"
  region         = var.region
  cidr_block     = "172.25.16.0/20"
}

## Create HVN for Consul
resource "hcp_hvn" "consul_hvn" {
  hvn_id         = "hcp-tf-consul-hvn"
  cloud_provider = "aws"
  region         = var.region
  cidr_block     = "172.18.16.0/20"
}
// Create a peering connection between two HVNs
resource "hcp_hvn_peering_connection" "peer" {
  hvn_1 = hcp_hvn.vault_hvn.self_link
  hvn_2 = hcp_hvn.consul_hvn.self_link
}


resource "hcp_consul_cluster" "consul" {
  hvn_id     = hcp_hvn.vault_hvn.hvn_id
  cluster_id = "hcp-tf-consul-cluster"
  tier       = "plus"

  lifecycle {
    ignore_changes = [consul_version, min_consul_version]
  }
}
##commented out due to not supporting vault-plus sku.
// Create a Vault cluster in the same region and cloud provider as the HVN
resource "hcp_vault_cluster" "vault" {
  cluster_id = "vault-plus"
  hvn_id     = hcp_hvn.vault_hvn.hvn_id
  tier = "plus_small"
  public_endpoint = true

  lifecycle {
    prevent_destroy = true
  }
  metrics_config {
    grafana_user = var.grafana_user
    grafana_endpoint = var.grafana_endpoint
    grafana_password = var.grafana_api_key
  }

  audit_log_config {
    grafana_user = var.grafana_log_user
    grafana_endpoint = var.grafana_log_endpoint
    grafana_password = var.grafana_log_api_key
  }
}

resource "hcp_vault_cluster_admin_token" "token" {
  cluster_id = hcp_vault_cluster.vault.cluster_id
}

### Azure Cluster

resource "hcp_hvn" "vault_hvn_az" {
  hvn_id         = "hcp-tf-vault-hvn-az"
  cloud_provider = "azure"
  region         = var.region_azure
  #cidr_block     = "172.25.16.0/20"
}

resource "hcp_vault_cluster" "vault_az" {
  cluster_id = "vault-az"
  hvn_id     = hcp_hvn.vault_hvn.hvn_id
  tier = "dev"
  public_endpoint = true

  lifecycle {
    prevent_destroy = true
  }
  }

resource "hcp_vault_cluster_admin_token" "token_az" {
  cluster_id = hcp_vault_cluster.vault_az.cluster_id
}

## PR Cluster, Singapore

resource "hcp_hvn" "vault_pr_hvn" {
  hvn_id         = var.vault_pr_hvn
  cloud_provider = "aws"
  region         = var.region_pr
  cidr_block     = "172.25.32.0/20"
}

resource "hcp_vault_cluster" "vault_pr" {
  hvn_id          = hcp_hvn.vault_pr_hvn.hvn_id
  cluster_id      = "vault-pr"
  tier = "plus_small"
  primary_link    = hcp_vault_cluster.vault.self_link
  # paths_filter    = ["do-not-replicate-namespace", "replicate-namespace/do-not-replicate-secrets"]
  public_endpoint = true
}