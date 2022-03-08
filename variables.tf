variable "region" {
    description = "vault region"
    default = "ap-southeast-2"  
}

variable "hcp_client_id" {
    description = "hcp-client-id"
    type = string
    default = ""
}

variable "hcp_client_secret" {
    description = "secret"
    type = string
    default = ""
}

variable "root_policy" {
    description = "root role"
    type = string
    default = "hcp-root"
  
}
