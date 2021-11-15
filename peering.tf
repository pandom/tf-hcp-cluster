# # // Create a VPC for the HVN to peer into
# # resource "aws_vpc" "main" {
# #   cidr_block = "172.25.0.0/20"
# # }
# ## Grab this from terraform-aws-core VPC ID
# # data "aws_arn" "main" {
# #   arn = aws_vpc.main.arn
# # }


# resource "aws_vpc_peering_connection_accepter" "main" {
#   vpc_peering_connection_id = hcp_aws_network_peering.example_peering.provider_peering_id
#   auto_accept               = true
# }

# // Create a network peering between the HVN and the AWS VPC
# resource "hcp_aws_network_peering" "example" {
#   hvn_id          = hcp_hvn.vault_hvn.hvn_id
#   peering_id      = "hcp-tf-example-peering"
#   peer_vpc_id     = aws_vpc.main.id
#   peer_account_id = aws_vpc.main.owner_id
#   peer_vpc_region = data.aws_arn.main.region
# }

# // Create an HVN route that targets your HCP network peering and matches your AWS VPC's CIDR block
# resource "hcp_hvn_route" "example" {
#   hvn_link         = hcp_hvn.hvn.self_link
#   hvn_route_id     = "hcp-tf-example-hvn-route"
#   destination_cidr = aws_vpc.main.cidr_block
#   target_link      = hcp_aws_network_peering.example.self_link
# }

# // Create a Consul cluster in the same region and cloud provider as the HVN