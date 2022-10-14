# output "vault_token" {
#   sensitive = true
#   value = hcp_vault_cluster_admin_token.token.token
# }

output "public_address_primary" {
    value = hcp_vault_cluster.vault.vault_public_endpoint_url
  
}
output "public_address_pr" {
    value = hcp_vault_cluster.vault_pr.vault_public_endpoint_url
  
}