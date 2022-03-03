# Token
resource "vault_token" "burkey" {
  policies = ["hcp-root"]

  renewable = true
  ttl = "2190h"

  renew_min_lease = 43200
  renew_increment = 86400
}


### JWT Authentication for Packer Github Actions
resource "vault_jwt_auth_backend" "this" {
  path = "gha"
 oidc_discovery_url = "https://token.actions.githubusercontent.com"
 bound_issuer       = "https://token.actions.githubusercontent.com"
}

resource "vault_jwt_auth_backend_role" "example" {
  backend         = vault_jwt_auth_backend.this.path
  role_name       = "gha-vault-jwt"
  token_policies  = [
  "default",
  "cloud_cred_read"
 ]

  bound_audiences = ["sigstore"]
  bound_claims = {
    "repository" = "pandom/packer-ubuntu"
  }
  user_claim      = "actor"
  role_type       = "jwt"
}
resource "vault_policy" "cloud_cred_read" {
  name = "cloud_cred_read"

  policy = <<EOT
path "aws/creds" {
  capabilities = ["read"]
}
path "gcp/creds" {
  capabilities = ["read"]
}
path "hcp/packer" {
  capabilities = ["read"]
}
EOT
}
