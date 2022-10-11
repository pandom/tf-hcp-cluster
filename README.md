# HCP Cluster Deployment

This repository contains terraform code that deploys various HCP services.

Currently it deploys the following:

- HCP Vault Plus in AWS region `ap-southeast2`
- HCP Consul in AWS region `ap-southeast2`
- HCP Vault Dev in Azure region `westus2`

It will also configure to [forward metrics and telemetry](https://developer.hashicorp.com/vault/tutorials/cloud-monitoring/vault-audit-log-grafana) from the HCP Vault Plus cluster in AWS to a pre-configured Grafana Cloud deployment.
## Topology

```mermaid
flowchart TD
u[Vault Requestor]-->in
u-->inaz
in-->awshvn
subgraph HCP
subgraph aws[AWS - ap-southeast-2]
in[Public FQDN]
subgraph vault
hcpvaws[Vault Plus]
awshvn[AWS HVN-1]
end
subgraph consul
awshvn2[AWS HVN-2]
hcpcaws[Consul]---awshvn2
end
end
subgraph az[Azure - uswest3]
inaz[Public FQDN]-->azhvn
subgraph vaz[vault]
hcpvaz[Vault Dev]
azhvn[Azure HVN-1]
end
end
end
subgraph g[Already Configured]
gcloud[Grafana Cloud]
end

hcpvaws-->awshvn
awshvn <--->|VPC Peering|awshvn2
hcpvaz-->azhvn
hcpvaws -.->|metrics + audit logs| g
```