#AWS REgion
variable "region" {
    description = "vault region"
    default = "ap-southeast-2"  
}
variable "region_pr" {
    description = "vault PR region"
    default = "eu-west-1"  
}
#Azure Region
variable "region_azure" {
    description = "azure beta vault region"
    default = "westus2"  
}


### HCP details. Overidden by a variable set in Terraform Cloud. JWT Auth for consuming workspaces into Vault
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
### Default root role. Adjust only if non default role used
variable "root_policy" {
    description = "root role"
    type = string
    default = "hcp-root"
  
}
### Logging endpoints are different from logging endpoints. The below variables take care of metrics 
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
### Logging endpoints are different from metrics endpoints. The below variables take care of logging
variable "grafana_log_api_key" {
    description = "grafana API key"
    type = string
  
}

variable "grafana_log_endpoint" {
    description = "Ingest URL"
    type = string
}

variable "grafana_log_user" {
    description = "User defined"
    type = string
}

variable "boundary_bootstrap_password" {
    description = "bootstrap password. Only works once"
    type = string
    default = "Hashi123!"
  
}

