variable "region" {
    description = "vault region"
    default = "ap-southeast-2"  
}

variable "hcp_client_id" {
    description = "hcp-client-id"
    type = string
}

variable "hcp_client_secret" {
    description = "secret"
    type = string
}

variable "root_policy" {
    description = "root role"
    type = string
    default = "hcp-root"
  
}
