variable "region" {
    description = "vault region"
    default = "ap-southeast-2"  
}



variable "hcp_client_id" {
    description = "hcp-client-id"
    type = string
    default = "client-burkey"
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

variable "grafana_api_key" {
    description = "grafana API key"
    type = string
  
}

variable "grafana_endpoint" {
    description = "Ingest URL"
    type = string
}

variable "grafana_user" {
    description = "User defined"
    type = string
}


