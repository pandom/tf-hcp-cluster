terraform {
  # cloud {
  #   #used for local state configuration/change if needed
  #   organization = "burkey"
  #   hostname = "app.terraform.io" # Optional; defaults to app.terraform.io

  #   workspaces {
  #     name = "tf-hcp-cluster"
  #   }
  # }
  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
      version = "0.45.0"
    }
  }
}

// Configure the provider
provider "hcp" {
    client_id = var.hcp_client_id
    client_secret =  var.hcp_client_secret
}

// Use the cloud provider AWS to provision resources that will be connected to HCP
provider "aws" {
  region = var.region
}
