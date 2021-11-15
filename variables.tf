variable "region" {
    description = "vault region"
    default = "ap-southeast-2"  
}

variable "hcp_client_id" {
    description = "hcp-client-id"
    type = string
}

variable "hcp_secret_id" {
    description = "secret"
    type = string
}
