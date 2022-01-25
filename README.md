# terraform-digitalocean-database
Terraform module which creates a DigitalOcean database cluster resource.

## Usage Examples
Some examples can be found in this repository:
* [PostgreSQL](https://github.com/pvlltvk/terraform-digitalocean-database/tree/master/examples/postgresql)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.10 |
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement\_digitalocean) | >= 2.16.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | >= 2.16.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [digitalocean_database_cluster.cluster](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/database_cluster) | resource |
| [digitalocean_database_connection_pool.connection_pool](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/database_connection_pool) | resource |
| [digitalocean_database_db.database](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/database_db) | resource |
| [digitalocean_database_firewall.firewall](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/database_firewall) | resource |
| [digitalocean_database_user.user](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/database_user) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_engine"></a> [cluster\_engine](#input\_cluster\_engine) | Database engine used by the cluster (ex. pg for PostreSQL, mysql for MySQL, redis for Redis, or mongodb for MongoDB) | `string` | n/a | yes |
| <a name="input_cluster_maintenance"></a> [cluster\_maintenance](#input\_cluster\_maintenance) | The day and the start hour of the maintenance window policy | `map(string)` | `null` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the cluster | `string` | n/a | yes |
| <a name="input_cluster_node_count"></a> [cluster\_node\_count](#input\_cluster\_node\_count) | Number of nodes that will be included in the cluster | `number` | n/a | yes |
| <a name="input_cluster_private_network_uuid"></a> [cluster\_private\_network\_uuid](#input\_cluster\_private\_network\_uuid) | The ID of the VPC where the database cluster will be located | `string` | `null` | no |
| <a name="input_cluster_region"></a> [cluster\_region](#input\_cluster\_region) | DigitalOcean region where the cluster will reside | `string` | n/a | yes |
| <a name="input_cluster_size"></a> [cluster\_size](#input\_cluster\_size) | Database Droplet size associated with the cluster (ex. db-s-1vcpu-1gb) | `string` | n/a | yes |
| <a name="input_cluster_tags"></a> [cluster\_tags](#input\_cluster\_tags) | A list of optional tags to add to the cluster | `list(string)` | `[]` | no |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | The version of the cluster | `string` | n/a | yes |
| <a name="input_create_firewall"></a> [create\_firewall](#input\_create\_firewall) | Controls if firewall should be created | `bool` | `false` | no |
| <a name="input_create_pools"></a> [create\_pools](#input\_create\_pools) | Controls if pools should be created | `bool` | `false` | no |
| <a name="input_databases"></a> [databases](#input\_databases) | A list of databases in the cluster | `list(string)` | `[]` | no |
| <a name="input_firewall_rules"></a> [firewall\_rules](#input\_firewall\_rules) | List of firewall rules associated with the cluster | `list(map(string))` | `[]` | no |
| <a name="input_mysql_sql_mode"></a> [mysql\_sql\_mode](#input\_mysql\_sql\_mode) | A comma separated string specifying the SQL modes for a MySQL cluster. | `string` | `null` | no |
| <a name="input_pools"></a> [pools](#input\_pools) | A list of connection pools in the cluster | `list(map(string))` | n/a | yes |
| <a name="input_redis_eviction_policy"></a> [redis\_eviction\_policy](#input\_redis\_eviction\_policy) | A string specifying the eviction policy for a Redis cluster. Valid values are: noeviction, allkeys\_lru, allkeys\_random, volatile\_lru, volatile\_random, or volatile\_ttl | `string` | `null` | no |
| <a name="input_users"></a> [users](#input\_users) | A list of users in the cluster | `list(map(string))` | n/a | yes |

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
| <a name="output_database_cluster_default_database"></a> [database\_cluster\_default\_database](#output\_database\_cluster\_default\_database) | Name of the cluster's default database |
| <a name="output_database_cluster_default_password"></a> [database\_cluster\_default\_password](#output\_database\_cluster\_default\_password) | Password for the cluster's default user |
| <a name="output_database_cluster_default_user"></a> [database\_cluster\_default\_user](#output\_database\_cluster\_default\_user) | Username for the cluster's default user |
| <a name="output_database_cluster_host"></a> [database\_cluster\_host](#output\_database\_cluster\_host) | The hostname of the database cluster |
| <a name="output_database_cluster_id"></a> [database\_cluster\_id](#output\_database\_cluster\_id) | The id of the database cluster |
| <a name="output_database_cluster_port"></a> [database\_cluster\_port](#output\_database\_cluster\_port) | Network port that the database cluster is listening on |
| <a name="output_database_cluster_private_host"></a> [database\_cluster\_private\_host](#output\_database\_cluster\_private\_host) | Same as host, but only accessible from resources within the account and in the same region |
| <a name="output_database_cluster_uri"></a> [database\_cluster\_uri](#output\_database\_cluster\_uri) | The full URI for connecting to the database cluster |
| <a name="output_database_cluster_urn"></a> [database\_cluster\_urn](#output\_database\_cluster\_urn) | The uniform resource name of the database cluster |
| <a name="output_database_firewall_id"></a> [database\_firewall\_id](#output\_database\_firewall\_id) | A unique identifier for the firewall |
| <a name="output_database_firewall_rule"></a> [database\_firewall\_rule](#output\_database\_firewall\_rule) | A map with rule's uuid, type, value and created\_at params |
| <a name="output_db_name"></a> [db\_name](#output\_db\_name) | The name for the database |
| <a name="output_user_password"></a> [user\_password](#output\_user\_password) | Password for the database user |
| <a name="output_user_role"></a> [user\_role](#output\_user\_role) | Role for the database user |
<!-- END_TF_DOCS -->
