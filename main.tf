terraform {
  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
      version = "0.22.0"
    }
  }
}

// Configure the provider
provider "hcp" {
    client_id = var.hcp_client_id
    client_secret =  var.hcp_secret_id
}

// Use the cloud provider AWS to provision resources that will be connected to HCP
provider "aws" {
  region = var.region
}
