resource "vault_token" "burkey" {
  policies = [var.root_policy]

  renewable = true
  ttl = "1000h"

  renew_min_lease = 43200
  renew_increment = 86400
}