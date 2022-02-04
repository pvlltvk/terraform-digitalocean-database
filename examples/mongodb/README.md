# Complete example for MongoDB

Configuration in this directory creates a set of DO resources including VPC, Droplet and MongoDB cluster with databases, users and firewall rules. Note that this is just an example whose purpose is to show the actual use of the module with other DO resources. You don't have to create Droplet or VPC in your particular environment.

## Usage

To run this example you need to create a DigitalOcean [personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) with a write scope. You must set the `do_token` variable with this token. Next run these commands:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.10 |
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement\_digitalocean) | >= 2.16.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | 2.17.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cluster"></a> [cluster](#module\_cluster) | ../../ | n/a |

## Resources

| Name | Type |
|------|------|
| [digitalocean_droplet.web](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/droplet) | resource |
| [digitalocean_vpc.foo-bar-vpc-sfo3](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_do_token"></a> [do\_token](#input\_do\_token) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_connection_pool_host"></a> [connection\_pool\_host](#output\_connection\_pool\_host) | The hostname used to connect to the database connection pool |
| <a name="output_connection_pool_id"></a> [connection\_pool\_id](#output\_connection\_pool\_id) | The ID of the database connection pool |
| <a name="output_connection_pool_password"></a> [connection\_pool\_password](#output\_connection\_pool\_password) | Password for the connection pool's user |
| <a name="output_connection_pool_port"></a> [connection\_pool\_port](#output\_connection\_pool\_port) | Network port that the database connection pool is listening on |
| <a name="output_connection_pool_private_host"></a> [connection\_pool\_private\_host](#output\_connection\_pool\_private\_host) | Same as pool host, but only accessible from resources within the account and in the same region |
| <a name="output_connection_pool_private_uri"></a> [connection\_pool\_private\_uri](#output\_connection\_pool\_private\_uri) | Same as pool uri, but only accessible from resources within the account and in the same region |
| <a name="output_connection_pool_uri"></a> [connection\_pool\_uri](#output\_connection\_pool\_uri) | The full URI for connecting to the database connection pool |
| <a name="output_database_cluster_database"></a> [database\_cluster\_database](#output\_database\_cluster\_database) | Name of the cluster's default database |
| <a name="output_database_cluster_host"></a> [database\_cluster\_host](#output\_database\_cluster\_host) | The hostname of the database cluster |
| <a name="output_database_cluster_id"></a> [database\_cluster\_id](#output\_database\_cluster\_id) | The id of the database cluster |
| <a name="output_database_cluster_password"></a> [database\_cluster\_password](#output\_database\_cluster\_password) | Password for the cluster's default user |
| <a name="output_database_cluster_port"></a> [database\_cluster\_port](#output\_database\_cluster\_port) | Network port that the database cluster is listening on |
| <a name="output_database_cluster_private_host"></a> [database\_cluster\_private\_host](#output\_database\_cluster\_private\_host) | Same as host, but only accessible from resources within the account and in the same region |
| <a name="output_database_cluster_uri"></a> [database\_cluster\_uri](#output\_database\_cluster\_uri) | The full URI for connecting to the database cluster |
| <a name="output_database_cluster_urn"></a> [database\_cluster\_urn](#output\_database\_cluster\_urn) | The uniform resource name of the database cluster |
| <a name="output_database_cluster_user"></a> [database\_cluster\_user](#output\_database\_cluster\_user) | Username for the cluster's default user |
| <a name="output_database_firewall_id"></a> [database\_firewall\_id](#output\_database\_firewall\_id) | A unique identifier for the firewall rule |
| <a name="output_database_firewall_rule"></a> [database\_firewall\_rule](#output\_database\_firewall\_rule) | A map with rule's uuid, type, value and created\_at params |
| <a name="output_db_name"></a> [db\_name](#output\_db\_name) | The name for the database |
| <a name="output_user_password"></a> [user\_password](#output\_user\_password) | Password for the database user |
| <a name="output_user_role"></a> [user\_role](#output\_user\_role) | Role for the database user |
<!-- END_TF_DOCS -->