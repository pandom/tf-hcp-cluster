output "vault_token" {
  sensitive = false
  value = hcp_vault_cluster_admin_token.token.token
}

output "public_address" {
    value = hcp_vault_cluster.vault.vault_private_endpoint_url
  
}